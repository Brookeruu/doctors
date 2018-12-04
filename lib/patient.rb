class Patient
  def initialize(attributes)
    @name = attributes[:name]
    @birthdate = attributes[:birthdate]
  end

  def self.all
    patients= []
    rows = DB.exec("SELECT * FROM patients")
    rows.each do |row|
      name = row["name"]
      birthdate = row["birthdate"]
      patient = Patient.new({:name => name, :birthdate => birthdate})
      patients.push(patient)
    end
    patients
  end

  def save
  end
end
