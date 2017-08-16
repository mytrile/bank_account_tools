RSpec::Matchers.define :have_valid_iban do |attribute|
  match do
    actual_class_name = subject.is_a?(Class) ? subject : subject.class
    actual = actual_class_name.new
    
    expect(actual).to be_invalid
    expect(actual.errors[attribute.to_sym]).to include('is of invalid format')
  end
end
