# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mysql2/extensions/version'

Gem::Specification.new do |spec|
  spec.name = 'mysql2-extensions'
  spec.version = Mysql2::Extensions::VERSION
  spec.authors = ['Roman Konoplev']
  spec.email = ['roman@konoplev.pro']

  spec.summary = 'Extensions for the Mysql2 Rubygem'
  spec.homepage = 'https://github.com/konoplev-roman/mysql2-extensions'
  spec.license = 'MIT'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'mysql2'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'simplecov'

  spec.add_dependency 'mysql2'
end
