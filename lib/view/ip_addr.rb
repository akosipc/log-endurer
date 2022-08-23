# frozen_string_literal: true

require_relative './base'

class View
  class IPAddr < View::Base
    DEFAULT_REGEX = /[0-9]{3}.[0-9]{3}.[0-9]{3}.[0-9]{3}/

    private

    def validate!
      unless @string =~ DEFAULT_REGEX
        raise View::URI::InvalidArgumentError,
              "String does not match the format. Value passed was #{@string}"
      end

      @value = @string
    end
  end
end
