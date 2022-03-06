module Formatter
  module PhoneNumber
    class UK
      class PhoneNumberTooShort < StandardError
        def message
          'This number is a little too short.'
        end
      end

      class PhoneNumberTooLong < StandardError
        def message
          'This number is a little too long.'
        end
      end

      class InvalidMobileFormat < StandardError
        def message
          'This is not a valid UK mobile phone number.'
        end
      end
    end
  end
end
