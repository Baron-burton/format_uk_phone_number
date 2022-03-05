require_relative 'uk/validations'
module Formatter
  module PhoneNumber
    class UK
      COUNTRY_CODE = '44'.freeze

      class << self
        def format(phone_number)
          phone_number.strip!

          phone_number = remove_prefixes(phone_number)
          validate_phone_number(phone_number)

          phone_number.prepend("+#{COUNTRY_CODE}")
        end

        private

        def validate_phone_number(phone_number)
          Formatter::PhoneNumber::UK::Validations.validate(phone_number)
        end

        def remove_prefixes(phone_number)
          if phone_number.start_with?('0')
            phone_number = chop_first_characters(phone_number)
          elsif phone_number.start_with?('44')
            phone_number = chop_first_characters(phone_number, start_from: 2)
          elsif phone_number.start_with?('+44')
            phone_number = chop_first_characters(phone_number, start_from: 3)
          end

          phone_number
        end

        def chop_first_characters(phone_number, start_from: 1)
          phone_number[start_from..-1]
        end
      end
    end
  end
end
