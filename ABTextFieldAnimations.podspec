Pod::Spec.new do |s|
 
  s.name         = "ABTextFieldAnimations"
  s.version      = "0.1"
  s.summary      = "Simple CoreAnimation based animations applied on UITextfields. Shake/Bounce your textfields. Animate opacity and text changes!”
  s.homepage     = "https://github.com/Abhishaker17/ABTextFieldAnimations"
  s.screenshots  = "https://github.com/Abhishaker17/ABTextFieldAnimations/blob/master/Animations.gif"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Abhishek Banthia" => "abhishekbanthia@me.com" }
  s.social_media_url   = "http://twitter.com/Abhi_shaker”
  s.platform     = :ios, "5.0"
  s.source       = { :git => "https://github.com/Abhishaker17/ABTextFieldAnimations.git", :tag => “0.1” }
  s.source_files  = "*.{h,m}"
  s.requires_arc = true

end
