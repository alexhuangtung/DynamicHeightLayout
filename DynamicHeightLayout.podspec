#
# Be sure to run `pod lib lint DynamicHeightLayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DynamicHeightLayout'
  s.version          = '0.1.0'
  s.summary          = 'A subclass of UICollectionViewLayout that arrange cell with different height.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Pass an object as a delegate when initializing DynamicHeightLayout and make it conform to DynamicHeightLayoutDelegate.'

  s.homepage         = 'https://github.com/alexhuangtung/DynamicHeightLayout'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'alexhuangtung' => 'alexhuangtung@gmail.com' }
  s.source           = { :git => 'https://github.com/alexhuangtung/DynamicHeightLayout.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.2'

  s.source_files = 'DynamicHeightLayout/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DynamicHeightLayout' => ['DynamicHeightLayout/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
