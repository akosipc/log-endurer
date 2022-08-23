# frozen_string_literal: true

require 'byebug'
require_relative './shared_examples/accumulator'

Dir[File.join('./lib/**/*.rb')].each { |f| require f }
