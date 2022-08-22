require_relative './base'

class View
  class IPAddr < View::Base
    DEFAULT_REGEX = /[0-9]{3}.[0-9]{3}.[0-9]{3}.[0-9]{3}/.freeze

    private

    def validate!
      raise View::URI::InvalidArgumentError, "String does not match the format. Value passed was #{@string}" unless @string =~ DEFAULT_REGEX

      @value = @string
    end
  end
end
