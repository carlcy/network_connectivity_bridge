# network_connectivity_bridge.podspec
Pod::Spec.new do |s|
  s.name             = 'network_connectivity_bridge'
  s.version          = '0.0.8'
  s.summary          = 'A Flutter plugin for network connectivity bridge.'

  s.description      = <<-DESC
A Flutter plugin for network connectivity bridge.
                       DESC

  s.homepage         = 'https://your.plugin.homepage' # 可以填仓库地址或留空
  s.license          = { :file => '../LICENSE' }     # 如果有license文件
  s.author           = { 'Your Name' => 'carlcy2023@163.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*.{h,m,swift}', 'network_connectivity_bridge/**/*.{h,m,swift}', '*.swift'
  s.public_header_files = 'Classes/**/*.h'

  s.dependency 'Flutter'

  # 指明支持的 iOS 最低版本
  s.platform     = :ios, '13.0'

  # 指明 Swift 版本，如果用 Swift
  s.swift_version = '5.0'
end
