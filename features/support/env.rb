require 'cucumber/api_steps'
require 'rack/test'
require 'rspec'

World(Rack::Test::Methods)

module Helpers
  OUTER_APP = Rack::Builder.parse_file('config.ru').first
  def app
    OUTER_APP
  end
end
World(Helpers)

# cucumber-api-steps uses the depricated rspec syntax =(
RSpec.configure do |config|
  config.expect_with(:rspec) { |c| c.syntax = :should }
end
