# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wdim/version'

Gem::Specification.new do |spec|
  spec.name          = 'wdim'
  spec.version       = Wdim::VERSION
  spec.authors       = ["gaaamii"]
  spec.email         = ["i1shi4ga4mi1@gmail.com"]

  spec.summary       = %q{Understand UNIX commands by extracting acronyms.}
  spec.description   = %q{Understand UNIX commands by extracting acronyms.}
  spec.homepage      = "https://github.com/gaaamii/wdim"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = "wdim"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
