# BankAccountTools

IBAN & BIC information, validation and formatting. Ships with ActiveModel validators.

Fork of [https://github.com/max-power/bank](max-power/bank) with rspec and custom matchers

## Installation

Add this line to your application's Gemfile:

    gem 'bank_account_tools'

And then execute:

    $ bundle

## Usage

### BankAccountTools::IBAN

#### General usage

```ruby
require 'bank_account_tools/iban'

iban = BankAccountTools::IBAN.new('DE89 3704 0044 0532 0130 00')

iban.country_code    # 'DE'
iban.check_digits    # '89'
iban.bban            # <BankAccountTools::BBAN...>
iban.bban.to_s       # '370400440532013000'
iban.account_number  # '0532013000'
iban.bank_identifier # '37040044'

iban.valid?          # true

iban.to_s            # 'DE89370400440532013000'
iban.to_s(true)      # 'DE89 3704 0044 0532 0130 00'

iban.to_i            # 370400440532013000131489

# or

BankAccountTools::IBAN.valid? 'DE89 3704 0044 0532 0130 00' # true
```

#### ActiveModel Validator

```ruby
class BankAccount
  include ActiveModel::Model

  validates :iban, iban: true
end
```

#### RSpec matcher

```ruby
describe BankAccount do
  it { should validae_iban(:iban) }
end
```

---

### BankAccountTools::BIC

#### General usage

```ruby
require 'bank_account_tools/bic'

bic  = BankAccountTools::BIC.new('BYLADEM1203')
bic.bank_code         # "BYLA"
bic.country_code      # "DE"
bic.location_code     # "M1"
bic.branch_code       # "203"
bic.to_s              # "BYLADEM1203"
bic.to_s(true)        # "BYLA DE M1 203"
bic.valid?            # true

# or

BankAccountTools::IBAN.valid? 'DE89 3704 0044 0532 0130 00' # true
```

#### ActiveModel Validator

```ruby
class BankAccount
  include ActiveModel::Model

  validates :bic, bic: true
end
```

#### RSpec matcher

```ruby
describe BankAccount do
  it { should validae_bic(:bic) }
end
```

### BankAccountTools::Contact

```ruby
require 'bank_account_tools/contact' # this requires 'iban' and 'bic'

# paramters: IBAN, BIC
contact = BankAccountTools::Contact.new('DE89 3704 0044 0532 0130 00', 'BYLADEM1203')
contact.iban    # <BankAccountTools::IBAN...>
contact.bic     # <BankAccountTools::BIC...>
contact.to_h    # {:iban=>"DE89370400440532013000", :bic=>"BYLADEM1203"}
contact.to_a    # ["DE89370400440532013000", "BYLADEM1203"]
contact.valid?  # true
```

## Testing

The default rake task will run the rspec suite

```sh
 $ rake
```

## Contributing

1. Fork it ( http://github.com/mytrile/bank_account_tools/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

Enhanced and maintained by [Dimitar Kostov](https://github.com/mytrile) [mitko.kostov@gmail.com](mailto:mitko.kostov@gmail.com)

Many thanks to original - [https://github.com/max-power/bank](max-power/bank)
