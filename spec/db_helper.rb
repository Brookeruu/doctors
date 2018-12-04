@@testing = false

if @@testing
  DB = PG.connect({:dbname => "doctors_office_test"})
else
  DB = PG.connect({:dbname => "doctors_office"})
end
