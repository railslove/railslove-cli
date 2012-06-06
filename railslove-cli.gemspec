# -*- encoding: utf-8 -*-
require File.expand_path('../lib/railslove-cli/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Lars Brillert"]
  gem.email         = ["lars@railslove.com"]
  gem.description   = %q{a nice cli for the railslove public api}
  gem.summary       = %q{want railslove at your fingertips? now you can!}
  gem.homepage      = "http://github.com/railslove/railslove-cli"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "railslove-cli"
  gem.require_paths = ["lib"]
  gem.add_dependency('thor')
  gem.add_dependency('httparty')
  gem.add_development_dependency('rake', '~> 0.8.0')
  gem.version       = Railslove::Cli::VERSION
end
