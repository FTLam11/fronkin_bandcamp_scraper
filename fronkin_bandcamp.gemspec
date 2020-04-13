
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fronkin_bandcamp/version'

Gem::Specification.new do |spec|
  spec.name          = 'fronkin_bandcamp'
  spec.version       = FronkinBandcamp::VERSION
  spec.authors       = ['Fronk Lom Lom']
  spec.email         = ['ryzingsun11@yahoo.com']

  spec.summary       = 'This gem is a convenient web scraper for Bandcamp releases.'
  spec.description   = 'YO, this gem is a convenient web scraper for Bandcamp releases. Currently, it scrapes artist and release information.'
  spec.homepage      = 'https://github.com/FTLam11/fronkin_bandcamp_scraper'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'nokogiri', '>= 1.10.4'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'pry', '~> 0.11'
  spec.add_development_dependency 'pry-byebug', '~> 3.6'
  spec.add_development_dependency 'awesome_print', '~> 1.8'
end
