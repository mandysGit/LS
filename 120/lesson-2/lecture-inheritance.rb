# 1. 
# class Dog
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end
# end

# class Bulldog < Dog
#   def swim
#     "can't swim!"
#   end
# end
# teddy = Dog.new
# puts teddy.speak           # => "bark!"
# puts teddy.swim           # => "swimming!"

# 2.
class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end


  def fetch
    'fetching!'
  end
end

class Cat < Pet
  def speak
    "meow!"
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

p pete.run                # => "running!"
# pete.speak              # => NoMethodError

p kitty.run               # => "running!"
p kitty.speak             # => "meow!"
# kitty.fetch             # => NoMethodError

p dave.speak              # => "bark!"

p bud.run                 # => "running!"
p bud.swim                # => "can't swim!"


# 3. 
=begin
   Pet
  /   \
Dog    Cat
/
BullDog
=end

# 4. 
=begin
The method lookup path is the order that Ruby looks for a method to be
invoked when a method it's called on an instance of an Object.
Ruby first looks at the Object's class, then the Modules that are included (in the order that they were first included), then superclass, and other superclasses up the hierarchy chain. 
=end

# Example: 
module Hi
end

module Hello
end

class Mandy
  include Hi
  include Hello
end

p Mandy.ancestors # => [Mandy, Hello, Hi, Object, Kernel, BasicObject]