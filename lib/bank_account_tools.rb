require 'bank_account_tools/version'
require 'bank_account_tools/iban'
require 'bank_account_tools/bic'
require 'bank_account_tools/bban'
require 'bank_account_tools/contact'

require 'pathname'
require 'yaml'

if defined?(::ActiveModel)
  require 'bank_account_tools/validators/bic_validator'
  require 'bank_account_tools/validators/iban_validator'
end

module BankAccountTools
  def self.load_specifications(name)
    YAML.load_file Pathname.new(__FILE__).dirname.parent + 'data' + "#{name}.yml"
  end
end
