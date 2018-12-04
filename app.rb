require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/doctor'
require './lib/patient'
require 'pry'
require 'pg'
require './spec/db_helper'

get '/' do
  erb(:index)
end

get '/admin' do
    @doctors = Doctor.all
    @patients = []
  erb(:admin)
end

post '/admin' do
  doc_name = params["doc_name"]
  specialty = params["specialty"]
  doctor = Doctor.new({:name => doc_name, :specialty => specialty})
  doctor.save
  @doctors = Doctor.all
  @patients = []
  erb(:admin)
end
