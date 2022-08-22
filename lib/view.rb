class View
  class InvalidArgumentError < StandardError; end

  attr_reader :uri, :ip_address

  def initialize(line, options = {})
    @line = line
    @options = options

    parse_line
  end

  private

  def parse_line
    uri_string, ip_addr_string = @line.split(' ')

    @uri = View::URI.new(uri_string)
    @ip_address = View::IPAddr.new(ip_addr_string)
  end
end
