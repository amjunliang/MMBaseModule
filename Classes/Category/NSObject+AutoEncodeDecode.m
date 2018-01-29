



#import "NSObject+AutoEncodeDecode.h"
#include <objc/runtime.h>
#include <objc/objc-auto.h>


@implementation NSObject (AutoEncodeDecode)

/** 序列化时调用
 *
 */
- (void)encodeWithCoder:(NSCoder *)encoder {
	Class cls = [self class];
	while (cls != [NSObject class]) {
		unsigned int numberOfIvars = 0;
		Ivar* ivars = class_copyIvarList(cls, &numberOfIvars);
		for(const Ivar* p = ivars; p < ivars+numberOfIvars; p++)
		{
			Ivar const ivar = *p;
			const char *type = ivar_getTypeEncoding(ivar);
			NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
			id value = [self valueForKey:key];
			if (value) {
				switch (type[0]) {
					case _C_STRUCT_B: {
						NSUInteger ivarSize = 0;
						NSUInteger ivarAlignment = 0;
						NSGetSizeAndAlignment(type, &ivarSize, &ivarAlignment);				
                        NSData *data = [NSData dataWithBytes:(__bridge void *)self + ivar_getOffset(ivar)
													  length:ivarSize];
						[encoder encodeObject:data forKey:key];
					}
						break;
					default:
						[encoder encodeObject:value
									   forKey:key];
						break;
				}						
			}
		}		
		cls = class_getSuperclass(cls);
	}
}

/** 反序列化时调用
 *
 */
- (id)initWithCoder:(NSCoder *)decoder {
	// because NSObject dose not have 'super', use 'self' instead.
	// if u have better solutions, please contact me.
	self = [self init];
	
	if (self) {
		Class cls = [self class];
		while (cls != [NSObject
					   class]) {
			unsigned int numberOfIvars = 0;
			Ivar* ivars = class_copyIvarList(cls, &numberOfIvars);
			
			for(const Ivar* p = ivars; p < ivars+numberOfIvars; p++)
			{
				Ivar const ivar = *p;
				const char *type = ivar_getTypeEncoding(ivar);
				NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
				id value = [decoder decodeObjectForKey:key];
				if (value) {
					switch (type[0]) {
						case _C_STRUCT_B: {
							NSUInteger ivarSize = 0;
							NSUInteger ivarAlignment = 0;
							NSGetSizeAndAlignment(type, &ivarSize, &ivarAlignment);				
							NSData *data = [decoder decodeObjectForKey:key];
                            char *sourceIvarLocation = (__bridge void *)self+ ivar_getOffset(ivar);								 
							[data getBytes:sourceIvarLocation length:ivarSize];
							// I get a wierd problem in 10.1, after I retrieved bytes from data, 
							// the struct size did have value here. But when the object is 
							// returned, I logged the size of the object, it's (0, 0).
							// If I added the memcpy function, it worked well, I did got the size(50, 30).
							// But now I removed the memcpy, it worked too.
							// I don't konw what happens here.
//							memcpy((char *)self + ivar_getOffset(ivar), sourceIvarLocation, ivarSize);
						}
							break;
						default:
							[self setValue:[decoder decodeObjectForKey:key]
									forKey:key];
							break;
					}
				}			
			}
			cls = class_getSuperclass(cls);
		}
	}
	
	return self;
}


@end
