class View
  class Base
    class InvalidArgumentError < StandardError; end
    class NotImplementedError < StandardError; end

    attr_reader :value

    def initialize(string, options = {})
      @string = string

      validate!
    end

    private

    def validate!
      raise NotImplementedError, "#{__method__} must be implemented in the subclass"
    end
  end
end
