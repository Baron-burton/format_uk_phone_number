require_relative 'uk/validations'
module Formatter
  module PhoneNumber
    class UK
      PREFIX = '+44'.freeze

      def self.format(phone_number)
        new(phone_number).format
      end

      def initialize(phone_number)
        @phone_number = phone_number
      end

      def format
        @phone_number.strip!

        remove_prefixes
        validate_phone_number

        @phone_number.prepend(PREFIX)
      end

      private

      def validate_phone_number
        Formatter::PhoneNumber::UK::Validations.validate(@phone_number)
      end

      def remove_prefixes
        if @phone_number.start_with?('0')
          chop_first_characters
        elsif @phone_number.start_with?('44')
          chop_first_characters(start_from: 2)
        elsif @phone_number.start_with?('+44')
          chop_first_characters(start_from: 3)
        end
      end

      def chop_first_characters(start_from: 1)
        @phone_number = @phone_number[start_from..-1]
      end
    end
  end
end
