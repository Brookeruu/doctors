require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
also_reload 'public/**/*.css'
require './lib/doctor'
require './lib/patient'
require 'pry'
require 'pg'



get '/' do
  erb(:index)
end
