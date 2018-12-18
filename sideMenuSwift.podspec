Pod::Spec.new do |s|
  s.name             = 'sideMenuSwift'
  s.version          = '1.0.0'
  s.swift_version =    '4.0'
  s.summary          = 'By far the most fantastic view I have seen in my entire life. No joke.'
 
  s.description      =  "long description of mypods."
 
  s.homepage         = 'https://github.com/mehulmodhvadiya/SideMenuDemo'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '<mehulmodhvadiya>' => '<modhvadiya.mehul@gmail.com>' }
  s.source           = { :git => 'https://github.com/mehulmodhvadiya/SideMenuDemo.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'sideMenuSwift'
s.requires_arc = true
 
end