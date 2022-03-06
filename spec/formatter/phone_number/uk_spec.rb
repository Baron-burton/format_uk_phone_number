require './formatter/phone_number/uk'
require 'spec_helper'

module Formatter
  module PhoneNumber
    describe UK do
      it 'formats the number correctly' do
        uk_phone_number = '07123456789'

        expect(described_class.format(uk_phone_number)).to eq('+447123456789')
      end

      it 'removes any whitespace' do
        uk_phone_number = ' 0712 345 6789 '

        expect(described_class.format(uk_phone_number)).to eq('+447123456789')
      end

      it 'formats the number correctly if it is missing its prefix' do
        uk_phone_number = '7123456789'

        expect(described_class.format(uk_phone_number)).to eq('+447123456789')
      end

      it 'formats the number correctly when it starts with 44' do
        uk_phone_number = '447123456789'

        expect(described_class.format(uk_phone_number)).to eq('+447123456789')
      end

      it 'formats the number correctly when it starts with +44' do
        uk_phone_number = '+447123456789'

        expect(described_class.format(uk_phone_number)).to eq('+447123456789')
      end

      it 'returns an error if the phone number is too short' do
        short_number = '0712345'

        expect{ described_class.format(short_number) }
          .to raise_error(
            Formatter::PhoneNumber::UK::PhoneNumberTooShort,
            'This number is a little too short.'
          )
      end

      it 'returns an error if the phone number is too long' do
        long_number = '071234567890'

        expect{ described_class.format(long_number) }
          .to raise_error(
            Formatter::PhoneNumber::UK::PhoneNumberTooLong,
            'This number is a little too long.'
          )
      end

      it 'returns an error if the number does NOT begin with a 7 after the prefix' do
        wrong_number = '09123456789'

        expect{ described_class.format(wrong_number) }
          .to raise_error(
            Formatter::PhoneNumber::UK::InvalidMobileFormat,
            'This is not a valid UK mobile phone number.'
          )
      end

      it 'returns an error if the input is not a number at all' do
        not_a_number = 'some string'

        expect{ described_class.format(not_a_number) }
          .to raise_error(
            Formatter::PhoneNumber::UK::InvalidMobileFormat,
            'This is not a valid UK mobile phone number.'
          )
      end
    end
  end
end
