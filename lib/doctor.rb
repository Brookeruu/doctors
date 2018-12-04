class Doctor
  attr_reader :name, :specialty

  def initialize(attributes)
    @name = attributes[:name]
    @specialty = attributes[:specialty]
  end

  def self.all
    doctors = []
    rows = DB.exec("SELECT * FROM doctors")
    rows.each do |row|
      name = row["name"]
      specialty = row["specialty"]
      doctor = Doctor.new({:name => name, :specialty => specialty})
      doctors.push(doctor)
    end
    doctors
  end

  def save
    DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}');")
  end

  def ==(other)
    @name == other.name && @specialty == other.specialty
  end
end
