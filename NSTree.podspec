Pod::Spec.new do |s|
s.name             = "NSTree"
s.version          = "0.0.1"
s.summary          = "B-Tree data structure implementation for iOS / objective-c without using CFTree"
s.description      = <<-DESC
B-Tree data structure implementation for iOS / objective-c without using CFTree. Can be used as a storage mechanism or to index large sets of data. Performs fairly well compared to Core Data and regular NSArrays. Keywords: iOS, tree, algorithms, data structures, binary, b-trees, core data, storage, unit tests, benchmarks.

Note: working on a database layer that uses the NSTree; feel free to check it out and contribute to it here: NSTreeDatabase.
DESC
s.homepage         = "https://github.com/carlinyuen/NSTree"
s.license          = 'MIT'
s.author           = { "Carlinyuen" => "email.me@carlinyuen.com" }
s.source           = { :git => "https://github.com/vbergae/NSTree", :tag => s.version.to_s }

s.platform            = :ios, '7.0'
s.requires_arc        = true

s.source_files        = 'NSTree/*.{h,m}'
s.public_header_files = 'NSTree/*.h'
s.frameworks          = 'Foundation'

end