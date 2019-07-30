Pod::Spec.new do |s|
  s.name = 'Tanjiro'
  s.version = '1.0.1'
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.summary = 'Layout Wrapper for NSLayoutAnchor'
  s.homepage = 'https://br.linkedin.com/in/jeanvinge'
  s.social_media_url = 'https://twitter.com/jean_vinge'
  s.authors = { "Jean Vinge" => "jean.vinge@gmail.com" }
  s.source = { :git => "https://github.com/jeanvinge/Tanjiro.git", :tag  => +s.version.to_s }
  s.platforms = { :ios => "11.0" }
  s.requires_arc = true
  s.swift_version = '5.0'
  s.cocoapods_version = '>= 1.4.0'

  s.default_subspec = "Core"
  s.subspec "Core" do |ss|
    ss.source_files  = "Sources/**/*.swift"
    ss.framework  = "UIKit"
 end
end
