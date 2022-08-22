class Commander
  class InvalidFilePathError < StandardError; end

  def initialize(file_path:, options: {})
    @file = File.open(File.join(__dir__, file_path))
    @options = options
  rescue Errno::ENOENT
    raise InvalidFilePathError, "File is not existing. File path passed was #{File.join(__dir__, file_path)}"
  end
end
