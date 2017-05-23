require 'time'

module Towable
  def tow(pounds)
    puts "Currently towing #{pounds} pounds."
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :year, :make, :speed
  @@num_vehicles = 0
 
  def initialize(year, color, make)
    @year = year
    @color = color
    @make = make
    @speed = 0
    @@num_vehicles += 1
  end

  def self.num_vehicles
    puts "There are #{@@num_vehicles} vehicles."
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles/gallons} miles per gallon of gas."
  end

  def speed_up(number)
    @speed += number
  end

  def brake(number)
    @speed -= number
  end

  def shut_off
    @speed = 0
  end

  def spray_paint(color)
    self.color = color
  end

  def age
    "Your #{self.make} is #{calculate_age} years old."
  end

  private

  def calculate_age
    Time.now.year - self.year
  end

end

class MyCar < Vehicle
  NUM_DOORS = 4

  def to_s
    "Car: #{year}, #{color}, #{make}."
  end
end

class MyTruck < Vehicle
  include Towable

  NUM_DOORS = 2

  def to_s
    "Truck: #{year}, #{color}, #{make}."
  end
end

puts Vehicle.gas_mileage(13, 351)  # => "27 miles per gallon of gas"

my_car = MyCar.new(1999, 'green', 'Corolla')
my_car.speed_up(50)
puts my_car.speed
puts my_car
car2 = MyCar.new(2000, 'red', 'Porsche')
Vehicle.num_vehicles

truck = MyTruck.new(2010, 'red', 'Chevy')
truck.tow(300)

# puts MyCar.ancestors
# puts MyTruck.ancestors

puts my_car.age
# puts my_car.calculate_age  # => error (private method)

# Fix the following code

class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

# bob = Person.new("Steve")
# bob.name = "Bob"

# => test.rb:9:in `<main>': undefined method `name=' for
#   #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)

class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end

end

# bob = Person.new("Steve")
# bob.name = "Bob"
# puts bob.name

class Student
  attr_accessor :name

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def grade=(grade)
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected # => allows us to reference other instance of same class

  def grade
    @grade
  end

end

joe = Student.new('Joe', 90)
bob = Student.new('Bob', 95)
puts joe.better_grade_than?(bob)

# Given the following code...

bob = Person.new
bob.hi

# And the corresponding error message...

# NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
# from (irb):8
# from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

# What is the problem and how would you go about fixing it?

# The problem is the #hi method is private. 