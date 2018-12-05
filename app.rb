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
    @patients = Patient.all
  erb(:admin)
end

post '/admin' do
  if params["doc_name"]
    name = params["doc_name"]
    specialty = params["specialty"]
    doctor = Doctor.new({:name => name, :specialty => specialty})
    doctor.save
  end
  if params["pat_name"]
    name = params["pat_name"]
    birthdate = params["birthdate"]
    patient = Patient.new({:name =>name, :birthdate => birthdate})
    patient.save
  end
  @doctors = Doctor.all
  @patients = Patient.all
  erb(:admin)
end

get '/patients/:id' do
  @patient = Patient.find(params[:id].to_i)
  @doctors = Doctor.all
  @doctor_name = ""
  if @patient.doctor_id
    doctor = Doctor.find(@patient.doctor_id)
    if doctor
      @doctor_name = doctor.name
    end
  end
  erb(:patient)
end

post '/patients/:id' do
  doc_id = params["doc_id"].to_i
  patient = Patient.find(params[:id].to_i)
  patient.set_doctor_id(doc_id)

  @patient = Patient.find(params[:id].to_i)
  @doctors = Doctor.all
  @doctor_name = ""
  if @patient.doctor_id
    doctor = Doctor.find(@patient.doctor_id)
    if doctor
      @doctor_name = doctor.name
    end
  end
  erb(:patient)
end

get '/doctor' do
  erb(:doctor)
end
