require 'spec_helper'

describe(Doctor) do
  describe('.all') do
    it('is empty first') do
      expect(Doctor.all).to eq([])
    end
  end

  describe('#save') do
    it('saves a new doctor') do
      doctor = Doctor.new({:name => "Dr. Brown", :specialty => "Cardiology"})
      doctor.save
      expect(Doctor.all).to eq([doctor])
    end
  end
end
