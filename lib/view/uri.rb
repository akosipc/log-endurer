require_relative './base'

class View
  class IPAddr < View::Base
    DEFAULT_REGEX = /[0-9]{3}.[0-9]{3}.[0-9]{3}.[0-9]{3}/.freeze

    attr_reader :ip_address

    private

    def validate!
      raise View::IPAddr::InvalidArgumentError, "String does not match the format. Value passed was #{@string}"  unless @string =~ DEFAULT_REGEX

      @ip_address = @string
    end
  end
end
