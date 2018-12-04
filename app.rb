require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
# also_reload 'public/**/*.css'
require './lib/doctor'
require './lib/patient'
require 'pry'
require 'pg'
require './spec/db_helper'

# if @@testing
#   DB = PG.connect({:dbname => "doctors_office_test"})
# else
#   DB = PG.connect({:dbname => "doctors_office"})
# end

get '/' do
  erb(:index)
end

get '/admin' do
    @doctors = Doctor.all
  erb(:admin)
end

post '/admin' do
  name = params["name"]
  specialty = params["specialty"]
  doctor = Doctor.new({:name => name, :specialty => specialty})
  doctor.save
  @doctors = Doctor.all
  erb(:admin)
end
