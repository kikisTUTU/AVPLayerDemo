#
#  Be sure to run `pod spec lint HKAVPlayerDemo.podspec' to ensure this is a
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
  一个简单的avplayer使用例子
  DESC

  spec.homepage     = "https://github.com/kikisTUTU/AVPLayerDemo"
  
  spec.license      = { :type => "MIT", :file => "LICENSE" }

 
  spec.author    = "hekai"

  spec.platform     = :ios, "11.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
 
  spec.source       = { :git => "https://github.com/kikisTUTU/AVPLayerDemo.git", :tag => spec.version }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source_files = "AVPlayerDemo/*.h", "AVPlayerDemo/*.m"

end









