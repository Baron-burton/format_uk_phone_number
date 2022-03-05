require_relative 'uk/validations'
module Formatter
  module PhoneNumber
    class UK
      COUNTRY_CODE = '44'

      def self.format(phone_number)
        new(phone_number).format
      end

      def initialize(phone_number)
        @phone_number = phone_number
      end

      def format
        @phone_number = @phone_number.strip

        if @phone_number.start_with?('0')
          @phone_number = chop_first_character
        end

        validate_phone_number

        @phone_number.prepend("+#{COUNTRY_CODE}")
      end

      private

      def chop_first_character
        @phone_number[1..-1]
      end

      def validate_phone_number
        Formatter::PhoneNumber::UK::Validations.validate(@phone_number)
      end
    end
  end
end
