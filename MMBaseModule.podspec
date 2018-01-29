#
# Be sure to run `pod lib lint MMBaseModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'MMBaseModule'
    s.version          = '1.0'
    s.summary          = 'MMBaseModule'
    
    s.homepage         = 'https://github.com/amjunliang/MMBaseModule'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'majunliang' => 'majunliang@zhangyue.com' }
    s.source           = { :git => 'https://github.com/amjunliang/MMBaseModule.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '8.0'
    s.source_files = 'Classes/**/*'
    s.frameworks = 'UIKit'
    
    
    # s.dependency 'AFNetworking', '~> 2.3'

    # s.resource_bundles = {
    #   'MMBaseModule' => ['MMBaseModule/Assets/*.png']
    # }
    
    # s.public_header_files = 'Pod/Classes/**/*.h'
    
    s.subspec 'Category' do |sp|
        sp.source_files = 'Classes/Category'
    end
    
    
end
