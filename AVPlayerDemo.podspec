#
#  Be sure to run `pod spec lint KTM-iOS-SDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "AVPlayerDemo"
  spec.version      = "1.0.0"
  spec.summary      = "test"

  spec.description  = <<-DESC
              test
                   DESC

  spec.homepage     = "https://github.com/kikisTUTU/AVPLayerDemo"
  
  #spec.license      = "MIT (example)"
  # spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }

 
  spec.author    = "hekai"

  spec.platform     = :ios, "11.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
 
  spec.source       = { :git => "https://github.com/kikisTUTU/AVPLayerDemo.git", :tag => spec.version }
  
  spec.requires_arc = true
  spec.user_target_xcconfig =   {'OTHER_LDFLAGS' => ['$(inherited)','-lObjC'], 'ENABLE_BITCODE' => 'NO'}
  spec.pod_target_xcconfig =   { 'VALID_ARCHS' =>  ['x86_64', 'arm64']}

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # spec.vendored_frameworks = ["*.framework","LightGame/*.framework","Network/*.framework","ThirdAdSDKs/GDTMobSDK/*.framework","ThirdAdSDKs/KSAdSDK/*.framework"]
  # spec.source_files = "LightGameSDKParam.plist"
  # spec.vendored_libraries = "ThirdAdSDKs/GDTMobSDK/lib/*.a"
  # spec.source_files = "ThirdAdSDKs/GDTMobSDK/lib/*.h"
  spec.source = ['AVPlayerDemo/PlayerView.h','AVPlayerDemo/PlayerView.m']
  # spec.resource = '*.bundle'
  # spec.dependency 'KTMMjuheSDK'
end









