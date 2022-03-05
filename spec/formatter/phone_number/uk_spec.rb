require './formatter/phone_number/uk'
require 'spec_helper'

module Formatter
  module PhoneNumber
    describe UK do
      it 'formats the number correctly' do
        uk_phone_number = '07123456789'

        expect(described_class.format(uk_phone_number)).to eq('+447123456789')
      end
    end
  end
end
