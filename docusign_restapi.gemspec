# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'docusign_restapi/version'

Gem::Specification.new do |spec|
  spec.name          = "docusign_restapi"
  spec.version       = DocusignRestapi::VERSION
  spec.authors       = ["Shanky Munjal"]
  spec.email         = ["shanky.munjal@quovantis.com"]
  spec.description   = %q{esign on files with docusign restapi}
  spec.summary       = %q{Docusign on fillable and non-fillable pdf}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "docusign_rest"
  spec.add_runtime_dependency "certified"
end
