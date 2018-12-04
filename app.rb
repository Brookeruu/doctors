require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
also_reload 'public/**/*.css'
require './lib/doctor.rb'
require './lib/patient.rb'
require 'pry'
require 'pg'

get '/' do
  erb(:index)
end
