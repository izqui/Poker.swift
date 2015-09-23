Pod::Spec.new do |s|
  s.name             = "Poker"
  s.version          = "0.1.1"
  s.summary          = "Swift framework for experimenting with Poker"
  s.description      = <<-DESC
                        Swift framework for experimenting with Poker.
DESC
  s.homepage         = "https://github.com/izqui/Poker.swift"

  s.license          = 'MIT'
  s.author           = { "Jorge Izquierdo" => "jorge@izqui.me" }
  s.source           = { :git => "https://github.com/izqui/Poker.swift.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/izqui9'
 
  s.platform     = :osx, '10.10'
  s.requires_arc = true

  s.source_files = 'Poker/*.swift'
end
