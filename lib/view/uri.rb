require_relative './base'

class View
  class URI < View::Base
    DEFAULT_REGEX = /\/\w+/.freeze

    private

    def validate!
      raise View::URI::InvalidArgumentError, "String does not match the format. Value passed was #{@string}"  unless @string =~ DEFAULT_REGEX

      @value = @string
    end
  end
end
