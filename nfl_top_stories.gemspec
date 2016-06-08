# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nfl_top_stories/version'

Gem::Specification.new do |spec|
  spec.name          = "nfl-top-stories"
  spec.version       = NflTopStories::VERSION
  spec.authors       = ["thebrianemory"]
  spec.email         = ["the@brianemory.com"]

  spec.summary       = %q{NFL Top Stories}
  spec.description   = %q{NFL Top Stories will pull NFL headlines and stories from ESPN, NFL.com, CBS Sports, Fox Sports, and USA Today.}
  spec.homepage      = "https://github.com/thebrianemory/nfl-top-stories-cli-gem"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
