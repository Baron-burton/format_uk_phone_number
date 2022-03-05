require_relative 'errors'

module Formatter
  module PhoneNumber
    class UK
      class Validations
        VALID_PHONE_NUMBER_LENGTH = 10.freeze

        attr_reader :phone_number

        def self.validate(phone_number)
          new(phone_number).validate
        end

        def initialize(phone_number)
          @phone_number = phone_number
        end

        def validate
          validate_is_a_mobile_number
          validate_phone_number_length
        end

        private

        def validate_phone_number_length
          if phone_number.length < VALID_PHONE_NUMBER_LENGTH
            raise PhoneNumberTooShort
          elsif phone_number.length > VALID_PHONE_NUMBER_LENGTH
            raise PhoneNumberTooLong
          end
        end

        def validate_is_a_mobile_number
          unless phone_number.start_with?('7')
            raise InvalidMobileFormat
          end
        end
      end
    end
  end
end
