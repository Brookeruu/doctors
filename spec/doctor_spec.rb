require 'spec_helper'

describe(Doctor) do
  describe('.all') do
    it('is empty first') do
      expect(Doctor.all).to(eq([]))
    end
  end

#   describe('#save') do
#   it('save a new doctor')
#   doctor = Doctor.new(name, specialty)
#   expect()
# end
end
