Pod::Spec.new do |s|

  s.name         = "CurrencyTextField"
  s.version      = "1.1"
  s.summary      = "A text field that takes input in currency format"

  s.homepage     = "https://github.com/richa008/CurrencyTextField"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = "MIT"

  s.author       = { "Deshmukh,Richa" => "richa008@gmail.com" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/richa008/CurrencyTextField.git", :tag => s.version.to_s }

  s.source_files  = "CurrencyTextField/*.swift"

end