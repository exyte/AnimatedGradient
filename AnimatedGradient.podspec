Pod::Spec.new do |s|
  s.name             = "AnimatedGradient"
  s.version          = "1.0.0"
  s.summary          = "AnimatedGradient is an animated view you can use as a nice background"

  s.homepage         = 'https://github.com/exyte/AnimatedGradient.git'
  s.license          = 'MIT'
  s.author           = { 'Exyte' => 'info@exyte.com' }
  s.source           = { :git => 'https://github.com/exyte/AnimatedGradient.git', :tag => s.version.to_s }
  s.social_media_url = 'http://exyte.com'

  s.ios.deployment_target = '15.0'
  
  s.requires_arc = true
  s.swift_version = "5.7"

  s.source_files = [
     'Sources/*.h',
     'Sources/*.swift',
     'Sources/**/*.swift'
  ]

end
