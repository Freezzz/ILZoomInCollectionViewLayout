Pod::Spec.new do |s|
  s.name         = "ILZoomInCollectionViewLayout"
  s.version      = "0.0.1"
  s.summary      = "Vertial UICollectionView layout with focus on current item."

  s.description  = <<-DESC
                   Simple UICollectionView layout that makes current item bigger when scrolling.
                   DESC

  s.homepage     = "https://github.com/Freezzz/ILZoomInCollectionViewLayout"
  s.license      = { :type => "MIT", :file => "LICENSE.md" }

  s.author             = { "Ivan Litsvinenka" => "me@freezzz.net" }
  s.social_media_url   = "https://twitter.com/freezzz"

  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/Freezzz/ILZoomInCollectionViewLayout", :tag => "0.0.1" }
  s.source_files = 'ILZoomInCollectionViewLayout/*.{h,m}'
  s.requires_arc = true

end