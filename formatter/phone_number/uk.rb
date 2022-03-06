require_relative 'uk/validations'
module Formatter
  module PhoneNumber
    class UK
      DELETABLE_PREFIXES = ['0', '44', '+44'].freeze
      PREFIX = '+44'.freeze

      def self.format(phone_number)
        new(phone_number).format
      end

      def initialize(phone_number)
        @phone_number = phone_number
      end

      def format
        remove_whitespace
        remove_prefixes
        validate_phone_number

        @phone_number.prepend(PREFIX)
      end

      private

      def remove_whitespace
        @phone_number.gsub!(' ', '')
      end

      def validate_phone_number
        Formatter::PhoneNumber::UK::Validations.validate(@phone_number)
      end

      def remove_prefixes
        DELETABLE_PREFIXES.each do |deletable_prefix|
          @phone_number.delete_prefix!(deletable_prefix)
        end
      end
    end
  end
end
