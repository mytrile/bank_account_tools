require 'spec_helper'

describe BankAccountTools::Contact do
  let(:iban) { BankAccountTools::IBAN.new('FR14 2004 1010 0505 0001 3M026 06') }
  let(:bic) { BankAccountTools::BIC.new('BYLADEM1203') }
  let(:contact) { BankAccountTools::Contact.new(iban, bic) }

  it 'is validate' do
    expect(contact).to be_valid
  end

  it 'has the right types' do
    expect(contact.iban).to be_kind_of(BankAccountTools::IBAN)
    expect(contact.bic).to be_kind_of(BankAccountTools::BIC)
  end

  it 'exports to_h' do
    expect(contact.to_h).to eq(
      iban: 'FR1420041010050500013M02606',
      bic: 'BYLADEM1203'
    )
  end

  it 'exports to_a' do
    expect(contact.to_a).to eq(['FR1420041010050500013M02606', 'BYLADEM1203'])
  end
end
