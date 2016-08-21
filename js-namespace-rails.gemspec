# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'js_namespace_rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'js-namespace-rails'
  spec.version       = JsNamespaceRails::VERSION
  spec.authors       = ['Jason Hou']
  spec.email         = ['hjj1992@gmail.com']

  spec.summary       = %q{js-namespace-rails let you choose which javascript snippet can execute in rails assets pipeline}
  spec.description   = %q{Namespace and Selectively Execute Javascript}
  spec.homepage      = 'https://github.com/falm/js-namespace-rails'

  spec.files         = Dir['{lib,app}/**/*'] + %w{README.md}
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.licenses      = ["MIT"]

  spec.required_ruby_version = '>= 2.0'
  spec.add_development_dependency 'railties', '>= 3.1'
  spec.add_development_dependency 'sprockets-rails'
  spec.add_development_dependency "bundler", ">= 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency "coveralls", '~> 0.7'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'rack', '~> 1.5'
  spec.add_development_dependency 'capybara-webkit'
end
