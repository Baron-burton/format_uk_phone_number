module Formatter
  module PhoneNumber
    class UK
      COUNTRY_CODE = '44'

      class << self
        def format(phone_number)
          phone_number = phone_number.strip

          if phone_number.start_with?('0')
            phone_number = chop_first_character(phone_number)
          end

          phone_number.prepend("+#{COUNTRY_CODE}")
        end

        private

        def chop_first_character(phone_number)
          phone_number[1..-1]
        end
      end
    end
  end
end
