# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pharaoh/version'

Gem::Specification.new do |spec|
  spec.name          = "pharaoh"
  spec.version       = Pharaoh::VERSION
  spec.authors       = ["Curtis Ekstrom"]
  spec.email         = ["code@fauxton.io"]
  spec.summary       = %q{Generate API tests from JSON-Schema documents}
  spec.description   = %q{Create test files to ensure backend compliance with a defined JSON-Schema}
  spec.homepage      = "https://github.com/fauxton/pharaoh"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"

  spec.add_dependency 'json_schema', '~> 0.3.0'
end
