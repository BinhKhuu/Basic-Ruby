require 'yaml'

class Person
  attr_accessor :name, :age, :gender

  def initialize
    @name = ""
    @age = 1
    @gender = ""
  end

  def save
    File.open('save1.yaml', 'w') do |f|
      f.puts YAML::dump(self)
    end
  end

  def load
    data = YAML.load_file('save1.yaml')
    p data
    puts data.name
    data
  end
  
end

p = Person.new 
p.name = 'david'
p.age = 28
p.gender = 'male'
puts p.name
p.save
a = p.load
puts a.name

#puts "Name #{p.name}"
#puts "Age #{p.age}"
#puts "Gender #{p.gender}"