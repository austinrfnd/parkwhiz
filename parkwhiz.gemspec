# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'parkwhiz/version'

Gem::Specification.new do |spec|
  spec.name          = "parkwhiz"
  spec.version       = Parkwhiz::VERSION
  spec.authors       = ["Austin Fonacier"]
  spec.email         = ["austinrf@gmail.com"]
  spec.summary       = "A Ruby gem wrapper to Parkwhiz.com's API"
  spec.description   = "A Ruby gem wrapper to Parkshiz.com's API.  Information on the API can be found here: http://www.parkwhiz.com/developers/"
  spec.homepage      = "http://github.com/austinrfnd/parkwhiz"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec', '~> 3.0.0'
  spec.add_development_dependency 'json', '~> 1.8.1'
  spec.add_dependency 'faraday'
  spec.add_dependency 'virtus'
  spec.add_dependency 'faraday_middleware'
end
