require 'doctor'
require 'patient'
require 'pg'
require 'rspec'
require 'pry'
require 'db_helper'


RSpec.configure do |config|
  config.before(:each) do
    @@testing = true
  end
  config.after(:each) do
    DB.exec("DELETE FROM doctors *")
    DB.exec("DELETE FROM patients *")
    @@testing = false
  end
end
