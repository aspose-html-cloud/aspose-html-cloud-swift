Pod::Spec.new do |s|
  s.name = 'AsposeHtmlCloud'
  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '9.0'
  s.version = '20.8.0'
  s.source = { :git => 'https://github.com/aspose-html-cloud/aspose-html-cloud-swift.git', :tag => 'v20.8.0' }
  s.authors = { 'Alexander Makogon' => 'alexander.makogon@aspose.com' }
  s.license = 'MIT'
  s.homepage = 'https://products.aspose.com/html'
  s.summary = 'Aspose Html Cloud SDK for iOS and macOS.'
  s.source_files = 'Sources/AsposeHtmlCloud/**/*.swift'
  s.dependency 'Alamofire', '~> 4.9.1'
  s.swift_versions = '5.1'
end
