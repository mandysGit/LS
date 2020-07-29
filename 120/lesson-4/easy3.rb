#1)
class Greeting
  def greet(message)
    puts message
  end
end

# class Hello < Greeting
#   def hi
#     greet("Hello")
#   end
# end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# hello = Hello.new
# hello.hi # output "Hello"

# hello = Hello.new
# hello.bye # undefined method

# hello = Hello.new
# hello.greet # ArgumentError, wrong number of arguments returned

# hello = Hello.new
# hello.greet("Goodbye") # ouitput "Goodbye"

# Hello.hi # undefined class method hi


#2)
class Hello < Greeting
  def self.hi
    greeting = Greeting.new
    greeting.greet("Hello")
  end
end

Hello.hi
# Change hi instance method to a class method
#  Note that we cannot simply call greet in the self.hi method definition because the Greeting class itself only defines greet on its instances, rather than on the Greeting class itself.

#3)
class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

cat1 = AngryCat.new(15, 'grumpy')
cat2 = AngryCat.new(10, 'devil')

#4)
class Cat
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{type} cat"
  end
end

p Cat.new('tabby').to_s

#5)
class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer # cannot call class method
tv.model #return nil

Television.manufacturer # return nil
Television.model # cannot call instance method

#6)
class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
    # @age += 1
  end
end

#7)
# no need for attr_accessor :brightness, :color
# return keyword