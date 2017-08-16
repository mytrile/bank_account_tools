require 'active_model/validator'

class BicValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid) unless BankAccountTools::BIC.valid?(value)
  end
end
