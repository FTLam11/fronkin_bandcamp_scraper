
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fronkin_bandcamp_scraper/version'

Gem::Specification.new do |spec|
  spec.name          = 'fronkin_bandcamp_scraper'
  spec.version       = FronkinBandcampScraper::VERSION
  spec.authors       = ['Fronk Lom Lom']
  spec.email         = ['ryzingsun11@yahoo.com']

  spec.summary       = 'This gem is a convenient web scraper for Bandcamp.'
  spec.description   = 'YO, this gem is a convenient web scraper for Bandcamp.'
  spec.homepage      = 'https://github.com/FTLam11/fronkin_bandcamp_scraper'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.7'
end
