# 1)
p true.class
p "hello".class
p [1,2,3, "happy days"].class
p 142.class

# Everything in Ruby is an Object.
# use Object#class to find out what class the object belongs to.

#2)
module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed

  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

# To check that Truck and Car classes have go_fast method
Truck.new.go_fast
Car.new.go_fast
p Car.new.public_method(:go_fast)
p Truck.new.public_method(:go_fast)

#3)
# self.class calls the class of the Object, either Car or Truck object
# self refers to the object itself
# self.class tells us the object's class
# we don't need to use to_s because it is inside of string interpolation

#4)
class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

cat = AngryCat.new

#5)
class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# Pizza has an instance variable because @name is an instance variable,
# instance variables start iwth @
# call Object#instance_variables

#6)

class Cube
  attr_reader :volume

  def initialize(volume)
    @volume = volume
  end
end

# Create attr_reader :volume to access the variable @volume, it creates a getter for @volume

#7)
# Object#to_s The default to_s prints the object's class and an encoding of the object id.
# Check documentation if the subclass overrides the Object#to_s

#8)
class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# self.age += 1, the self refers to the Object Cat, the instance of Cat
# self refers to the instance(object) because self is called inside an instance method,
# and only instances of the Class can call an instance method


#9)
class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count #self refers to the class Cat (itself), this is a class method
    @@cats_count
  end
end

#10)
class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

bag = Bat.new('yellow','cotton')