require 'spec_helper'

describe BankAccountTools::BIC do
  let(:bic) { described_class.new('ABNACHZ8XXX')}

  it 'returns the right bank code' do
    expect(bic.bank_code).to eq('ABNA')
  end

  it 'returns the right country code' do
    expect(bic.country_code).to eq('CH')
  end

  it 'returns the right location code' do
    expect(bic.location_code).to eq('Z8')
  end

  it 'returns the right branch code' do
    expect(bic.branch_code).to eq('XXX')
  end

  [
    'UCJAES2MXXX',
    'ABAGATWWXXX',
    'UCJAES2MXXX'
  ].each do |code|
    describe code do
      it 'has a valid format' do
        expect(BankAccountTools::BIC.new(code)).to be_valid
      end
    end
  end

  [
    '12341234',    # only digits
    'UCJAES2MXAA', # branch code starts with 'X'
    'UCJAES2MAA',  # too short
    'UCJAES2M0001' # too long
  ].each do |code|
    describe code do
      it 'has an invalid format' do
        expect(BankAccountTools::BIC.new(code)).not_to be_valid
      end
    end
  end

end
