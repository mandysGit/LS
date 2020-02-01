module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  attr_accessor :model, :color, :speed
  attr_reader :year
  @@number_of_vehicles = 0

  def initialize(year, model, color)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@number_of_vehicles += 1  
  end

  def self.number_of_vehicles
    puts "There are #{@@number_of_vehicles} vehicles created."
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def speed_up(number)
    @speed += number
    puts "You push the gas and accelerate #{number} mph."
  end
  
  def brake(number)
    @speed -= number unless self.speed == 0
    puts "You push the brake and decelerate #{self.speed} mph."
  end

  def current_speed
    puts "You are now going #{self.speed} mph."
  end

  def shut_down
    self.speed = 0
    puts "Car is shut down."
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{self.color} paint job looks great!"
  end

  def age
    puts "Your #{self.model} is #{calculate_age(year)} years old."
  end

  private

  def calculate_age(year)
    Time.new.year - self.year.to_i
  end
end

class MyTruck < Vehicle
  include Towable

  NUMBER_OF_DOORS = 2

  def to_s
    puts "This truck is a #{self.color} #{self.model} built in the year #{self.year}"
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    puts "This car is a #{self.color} #{self.model} built in the year #{self.year}"
  end
end


lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina.speed_up(20)
lumina.current_speed
lumina.speed_up(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.shut_down
lumina.current_speed

lumina.color = 'black'
puts lumina.color
puts lumina.year
lumina.spray_paint('red')

MyCar.gas_mileage(13, 351)
lumina.to_s

#####################################################
my_car = MyCar.new(2010, "Ford Focus", "silver")
my_truck = MyTruck.new(2010, "Ford Focus", "white")
my_car.to_s
my_truck.to_s

p my_truck.can_tow?(1000)
Vehicle.number_of_vehicles


puts MyCar.ancestors
puts '---'
puts MyTruck.ancestors
puts '---'
puts Vehicle.ancestors

my_car.age

#########################################################
#7

class Student
  attr_reader :name

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  def grade
    @grade
  end
end

mandy = Student.new('mandy', 100)
bob = Student.new('bob', 50)
p mandy.better_grade_than?(bob)
