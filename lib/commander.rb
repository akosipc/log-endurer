require 'csv'

class Commander
  class InvalidFilePathError < StandardError; end

  def initialize(file_path:, options: {})
    @file = File.open(File.join(__dir__, file_path))
    @options = options
  rescue Errno::ENOENT
    raise InvalidFilePathError, "File is not existing. File path passed was #{File.join(__dir__, file_path)}"
  end

  def unique_views
    accumulate.then do |views|
      grouped_views = views.group_by { |acc| acc.uri.value }

      grouped_views.map do |key, value|
        grouped_views[key] = value.uniq { |acc| acc.ip_address.value }
      end

      grouped_views
    end
  end
  
  private

  def accumulate
    [].tap do |array|
      CSV.foreach(@file) do |row|
        array << View.new(row.first)
      end
    end
  end
end
