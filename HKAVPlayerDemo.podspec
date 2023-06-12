#
#  Be sure to run `pod spec lint KTM-iOS-SDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "HKAVPlayerDemo"
  spec.version      = "1.0.0"
  spec.summary      = "test"

  spec.description  = <<-DESC
  test
  DESC

  spec.homepage     = "https://github.com/kikisTUTU/AVPLayerDemo"
  
  spec.license      = "MIT"
  # spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }

 
  spec.author    = "hekai"

  spec.platform     = :ios, "11.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
 
  spec.source       = { :git => "https://github.com/kikisTUTU/AVPLayerDemo.git", :tag => spec.version }
  
  spec.requires_arc = true
  spec.user_target_xcconfig =   {'OTHER_LDFLAGS' => ['$(inherited)','-lObjC'], 'ENABLE_BITCODE' => 'NO'}
  spec.pod_target_xcconfig =   { 'VALID_ARCHS' =>  ['x86_64', 'arm64']}

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source_files = "AVPlayerDemo/*.h", "AVPlayerDemo/*.m"

end









