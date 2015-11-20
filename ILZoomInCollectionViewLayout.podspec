Pod::Spec.new do |s|
  s.name = 'ILZoomInCollectionViewLayout'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'Vertial UICollectionView layout with focus on current item.'
  s.homepage = 'https://github.com/Freezzz/ILZoomInCollectionViewLayout'
  
  s.requires_arc = true
  s.platform = :ios, '7.0'
  
  s.author = { "Ivan Litsvinenka" => "me@freezzz.net" }
  
  s.source_files = 'ILZoomInCollectionViewLayout/*.{h,m}'
  s.source = { :git => 'https://github.com/Freezzz/ILZoomInCollectionViewLayout.git', :tag => '0.0.1' }  
end