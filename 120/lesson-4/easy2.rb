#1)
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new # creates an instance of Oracle
oracle.predict_the_future # returns a string "You will " + one of the strings elements defined in the array of the choices method


#2)
class RoadTrip < Oracle
  def chooses
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
# initializes local variable trip as a new instance of RoadTrip class

trip.predict_the_future
# calls predict_the_future instance method from Oracle class
# Then calls choices instsance method from RoadTrip object
# returns a String, "You will " + "visit Vegas", or "fly to Fiji", or "romp in Rome"
# Since we're calling predict_the_future on an instance of RoadTrip, every time Ruby tries to resolve a method name, it will start with the methods defined on the class you are calling.
# Ruby will first look for a definition of choices in RoadTrip before falling back to Oracle if it does not find choices defined in RoadTrip


#3)
module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

p Orange.ancestors # Orange, Taste
p HotSauce.ancestors # HotSauce, Taste

# ask the class itself to tell you directly the ancestors
# called lookup chain

# 4)
class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

#5)
# excited_dog = "excited dog" # local variable
# @excited_dog = "excited dog"
# instance variable start with @, accessible to an instance object
# @@excited_dog = "excited dog"
# class variable start with @@, accessible to all instance objects

#6)
class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# self.manufacturer is a class method because it is prefixed with self

#7)
class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

# @@cats_count variable keeps count of how many instances of the class Cat is instantiated. @@cat_count is incremented within the initialized instance variable.
# we can test this by:

cat1 = Cat.new('persian')
cat2 = Cat.new('main coon')
p Cat.cats_count

#8)
class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# use < for inheritance
# Bingo < Game

#9)
class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end

  def play
    "Play Bingo!"
  end
end

# adding a play instance method in Bing class overrides
# the play instance method of Game class
# calling play on an instance of Bingo, will call Bingo's play method
# instead of game's play method.

#10)
=begin

1. Creating objects allows programmers to think more abstractly about the code they are writing.
2. Objects are represented by nouns so are easier to conceptualize.
3. It allows us to only expose functionality to the parts of code that need it, meaning namespace issues are much harder to come across.
4. It allows us to easily give functionality to different parts of an application without duplication.
5. We can build applications faster as we can reuse pre-written code.
6. As the software becomes more complex this complexity can be more easily managed.

=end