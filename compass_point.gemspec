lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)
require 'compass_point'

Gem::Specification.new do |s|
  s.name = 'compass_point'
  s.version = CompassPoint::VERSION
  s.authors = ['Keith Morrison']
  s.email = 'keithm@infused.org'
  s.homepage = 'http://github.com/infused/compass_point'
  s.summary = 'A Ruby library for working with compass points'
  s.description = 'A Ruby library for working with compass points'
  s.license = 'MIT'

  s.rdoc_options = ['--charset=UTF-8']
  s.extra_rdoc_files = ['README.md', 'LICENSE']
  s.files = Dir['LICENSE', 'README.md', '{lib,spec}/**/*.rb', 'compass_point.gemspec']
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 3.1.0'
  s.metadata['rubygems_mfa_required'] = 'true'
end
