# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sheep/version'

Gem::Specification.new do |gem|
  gem.name          = "sheep"
  gem.version       = Sheep::VERSION
  gem.authors       = ["Paul Thornthwaite"]
  gem.email         = ["tokengeek@gmail.com"]
  gem.description   = %q{A fake cloud provider}
  gem.summary       = %q{A fake cloud provider that exposes a simple API for integrating with fog cloud library}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency("rack")
  gem.add_dependency("activesupport")
  gem.add_dependency("builder")

  gem.add_development_dependency("yard")
end
