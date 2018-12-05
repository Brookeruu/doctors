class Patient
  attr_reader :name, :birthdate, :id

  def initialize(attributes)
    @name = attributes[:name]
    @birthdate = attributes[:birthdate]
    @id = attributes[:id]
  end

  def self.all
    patients= []
    rows = DB.exec("SELECT * FROM patients")
    rows.each do |row|
      name = row["name"]
      birthdate = row["birthdate"]
      id = row["id"].to_i
      patient = Patient.new({:name => name, :birthdate => birthdate, :id => id})
      patients.push(patient)
    end
    patients
  end

  def self.find(id)
    row = DB.exec("SELECT * FROM patients WHERE id = #{id}").first
    name = row["name"]
    birthdate = row["birthdate"]
    patient = Patient.new({:name => name, :birthdate => birthdate, :id => id})
  end

  def save
    values = DB.exec("INSERT INTO patients (name, birthdate) VALUES ('#{@name}', '#{@birthdate}') RETURNING id")
    @id = values.first["id"].to_i
  end

  def ==(other)
    @name == other.name && @birthdate == other.birthdate
  end

  def set_doctor_id(id)
    DB.exec("UPDATE patients SET doctor_id = #{id} WHERE id = #{@id}")
  end
end
