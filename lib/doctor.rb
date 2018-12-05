class Doctor
  attr_reader :name, :specialty, :id

  def initialize(attributes)
    @name = attributes[:name]
    @specialty = attributes[:specialty]
    @id = attributes[:id]
  end

  def self.all
    doctors = []
    rows = DB.exec("SELECT * FROM doctors")
    rows.each do |row|
      name = row["name"]
      specialty = row["specialty"]
      id = row["id"].to_i
      doctor = Doctor.new({:name => name, :specialty => specialty, :id => id})
      doctors.push(doctor)
    end
    doctors
  end

  def save
    values = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id")
    @id = values.first['id'].to_i
  end

  def ==(other)
    @name == other.name && @specialty == other.specialty
  end
end
