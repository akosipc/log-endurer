#!/usr/bin/env ruby
# frozen_string_literal: true

Dir[File.join('./lib/**/*.rb')].each { |f| require f }

commander = Commander.new(file_path: ARGV[0])

result = commander.unique_views.then do |views|
  commander.sort_by_views(views)
end

result.each do |k, v|
  puts "#{k} => #{v.count} views"
end
