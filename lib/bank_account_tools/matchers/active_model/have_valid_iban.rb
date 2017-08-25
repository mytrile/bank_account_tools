RSpec::Matchers.define :have_valid_iban do |attribute|
  match do |actual|
    expect(actual).to be_invalid
    expect(actual.errors[attribute.to_sym]).to include('is of invalid format')
  end
end
