#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'network_connectivity_bridge'
  s.version          = '0.0.8'
  s.summary          = 'A singleton wrapper for connectivity_plus to avoid listener conflicts in plugins and apps.'
  s.description      = <<-DESC
A singleton wrapper for connectivity_plus to avoid listener conflicts in plugins and apps.
This ensures that both plugins and your app can listen to network status changes safely.
                       DESC
  s.homepage         = 'https://github.com/carlcy/network_connectivity_bridge'
  s.license          = { :type => 'MIT', :file => '../LICENSE' }
  s.author           = { 'carlcy' => 'carlcy@example.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'FlutterMacOS'
  s.dependency 'connectivity_plus_macos'

  s.platform = :osx, '10.14'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end 