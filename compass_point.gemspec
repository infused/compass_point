require_relative 'lib/compass_point/version'

Gem::Specification.new do |s|
  s.name = 'compass_point'
  s.version = CompassPoint::VERSION
  s.authors = ['Keith Morrison']
  s.email = 'keithm@infused.org'
  s.homepage = 'https://github.com/infused/compass_point'
  s.summary = 'A Ruby library for working with compass points'
  s.description = 'Convert between compass point names, abbreviations, bearings, and azimuths (degrees and radians).'
  s.license = 'MIT'

  s.files = Dir['CHANGELOG.md', 'LICENSE', 'README.md', '{lib,spec}/**/*.rb', 'compass_point.gemspec']
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 3.2.0'
end
