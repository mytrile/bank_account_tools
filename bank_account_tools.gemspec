lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bank_account_tools/version'

Gem::Specification.new do |spec|
  spec.name          = 'bank_account_tools'
  spec.version       = BankAccountTools::VERSION
  spec.authors       = ['Dimitar Kostov', 'Kevin']
  spec.email         = ['mitko.kostov@gmail.com', 'kevin.melchert@gmail.com']
  spec.summary       = %q{Bank account tools for dealing with IBANs/BICs}
  spec.description   = %q{Bank account tools for dealing with IBANs/BICs: information, validation and formatting.}
  spec.homepage      = 'https://github.com/mytrile/bank_account_tools'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'activemodel', '~> 4.0'
end
