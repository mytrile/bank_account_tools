require 'spec_helper'

class BankAccount
  include ActiveModel::Model

  attr_accessor :iban_required, :iban_optional

  validates :iban_required, iban: true
  validates :iban_optional, iban: true, allow_nil: true
end

describe IbanValidator do
  let(:model) { BankAccount.new }

  it 'is valid' do
    model.iban_required = 'FR1420041010050500013M02606'

    expect(model).to be_valid
  end

  it 'is not valid' do
    model.iban_required = 'FR1420041010050500013'

    expect(model).to be_invalid
    expect(model.errors[:iban_required]).to include('is invalid')
  end

  it 'does not validate with nil value' do
    model.iban_required = 'FR1420041010050500013M02606'
    model.iban_optional = nil

    expect(model).to be_valid
  end
end
