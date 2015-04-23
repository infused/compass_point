lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
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
  s.files = Dir['[A-Z]*', '{lib,spec}/**/*', 'compass_points.gemspec']
  s.test_files = Dir.glob('spec/**/*_spec.rb')
  s.require_paths = ['lib']

  s.required_rubygems_version = '>= 1.3.0'
end
