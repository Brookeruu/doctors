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
  erb(:admin)
end

post '/admin' do

  erb(:admin)
end
