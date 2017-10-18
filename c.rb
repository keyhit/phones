puts "c.rb"
class SolarSys
  attr_accessor :distanse
  def self.earth(distance)
    @earth = "Earth"
    @moon = "Moon"
    puts "From #{@moon} to #{@earth} distance #{distance} miles!"
  end
end

# class Space
#   def galaxy
#     place = SolarSys.earth
#     puts place
#   end
# end

# Space.new.galaxy 

# dis = SolarSys.new
# dis.distanse = "10"
# dis.earth

s_dis = SolarSys.earth("10")

# class Person
#   attr_accessor :name

#   def greeting
#     puts "Hello #{@name}"
#   end
# end

# person = Person.new
# person.name = "Dennis"
# person.greeting # => "Hello Dennis"