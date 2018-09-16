# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

use_frameworks!

target 'RbSwift iOS' do
  platform :ios, '8.0'
  target 'RbSwiftTests iOS' do
    inherit! :search_paths
    inhibit_all_warnings!
    pod 'Nimble'
    pod 'Quick'
  end
end

target 'RbSwift macOS' do
  platform :osx, '10.10'
  target 'RbSwiftTests macOS' do
    inherit! :search_paths
    inhibit_all_warnings!
    pod 'Nimble'
    pod 'Quick'
  end
end
