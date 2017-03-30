#  Be sure to run `pod spec lint RbSwift.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "RbSwift"
  s.version      = "0.1.0"
  s.summary      = "A Swift port of convenient methods in Ruby and ActiveSupport"
  s.description  = <<-DESC
  RbSwift introduces a series of methods which is inspired by Ruby core library and
  ActiveSupport. It provides hundred of convenient functions to make Swift code easier
  to write.
                   DESC
  s.homepage     = "http://github.com/Draveness/RbSwift"
  s.license      = "MIT"
  s.author             = { "draveness" => "i@draveness.me" }
  s.source       = { :git => "git@github.com:Draveness/RbSwift.git", :tag => "#{s.version}" }

  s.platform     = :ios
  s.ios.deployment_target = "8.0"

  s.source_files  = "RbSwift", "RbSwift/**/*.{h,swift}"
  s.public_header_files = "RbSwift/RbSwift.h"

  s.requires_arc = true
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.1' }
end
