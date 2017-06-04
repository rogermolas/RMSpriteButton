#
# Be sure to run `pod lib lint RMSpriteButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RMSpriteButton'
  s.version          = '1.0'
  s.summary          = 'UIButton like control for SpriteKit'

  s.homepage         = 'https://github.com/rogermolas/RMSpriteButton'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Roger Molas' => 'contact@rogermolas.com' }
  s.source           = { :git => 'https://github.com/rogermolas/RMSpriteButton.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/roger_molas'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Source/RMSpriteButton.swift'
  
end
