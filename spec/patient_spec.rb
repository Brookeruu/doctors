require 'spec_helper'

describe(Patient) do
  describe('.all') do
    it('is empty first') do
      expect(Patient.all).to eq([])
    end
  end
end

describe('#save') do
  it('saves a new patient') do
    patient = Patient.new({:name => "Brooke", :birthdate => "1964-01-01", :id => nil, :doctor_id => nil})
    patient.save
    expect(Patient.all).to eq([patient])
  end
end
