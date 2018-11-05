# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'bundler/setup'
require 'mysql2/extensions'

RSpec.configure do |config|
  # test quarantine
  config.filter_run_excluding quarantine: true
end
