# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'js_namespace_rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'js-namespace-rails'
  spec.version       = JsNamespaceRails::VERSION
  spec.authors       = ['Jason Hou']
  spec.email         = ['hjj1992@gmail.com']

  spec.summary       = %q{js-namespace-rails let you choose which javascript snippet can executive in rails assets pipline}
  spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = 'https://github.com/falm/js-namespace-rails'

  # spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.files         = Dir['{lib,app}/**/*'] + %w{MIT-LICENSE, README.md}
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end


  spec.add_dependency 'railties', '>= 3.1'
  spec.add_dependency 'sprockets-rails'
  spec.add_dependency 'jquery-rails'#, '~> 3.0'

  spec.add_development_dependency 'jquery-rails'#, "~> 3.0"
  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
