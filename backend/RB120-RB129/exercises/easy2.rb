# 1. Fix the Program - Mailable
module Mailable
  def print_address
    puts "#{name}"
    puts "#{address}"
    puts "#{city}, #{state} #{zipcode}"
  end
end

class Customer
  include Mailable
  attr_reader :name, :address, :city, :state, :zipcode
end

class Employee
  include Mailable
  attr_reader :name, :address, :city, :state, :zipcode
end

# betty = Customer.new 
# bob = Employee.new
# betty.print_address
# bob.print_address

# 2. Fix the Program - Drivable
module Drivable
  def drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive

# 3. Complete the Program - Houses
class House
  attr_reader :price
  include Comparable

  def initialize(price)
    @price = price
  end

  def <=>(other_house)
    price <=> other_house.price
  end
end

# home1 = House.new(100_000)
# home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1 < home2
# puts "Home 2 is more expensive" if home2 > home1



# 4. Reverse Engineering
class Transform
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def self.lowercase(data)
    data.downcase
  end

  def uppercase
    data.upcase
  end
end

# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')



# 5. What Will This Do?
class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

# thing = Something.new
# puts Something.dupdata # 'ByeBye'
# puts thing.dupdata # 'HelloHello'



# 6. Comparing Wallets
class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end

  protected

  attr_reader :amount
end

# bills_wallet = Wallet.new(500)
# pennys_wallet = Wallet.new(465)

# if bills_wallet > pennys_wallet
#   puts 'Bill has more money than Penny'
# elsif bills_wallet < pennys_wallet
#   puts 'Penny has more money than Bill'
# else
#   puts 'Bill and Penny have the same amount of money.'
# end



# 7. Pet Shelter
class Pet
  attr_reader :animal, :name
  @@pets = []

  def initialize(animal, name)
    @animal = animal
    @name = name
    @@pets.push(self.to_s)
  end

  def self.pets_unadopted
    @@pets
  end

  def to_s
    "a #{animal} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets
  attr_accessor :number_of_pets

  def initialize(name)
    @name = name
    @pets = []
    @number_of_pets = 0
  end
end

class Shelter
  attr_reader :owners
  attr_writer :pets

  def initialize
    @owners = {}
    @pets = []
    print_unadopted_pets
  end

  def adopt(owner, pet)
    owner.pets << pet
    owner.number_of_pets = owner.number_of_pets + 1
    owners[owner.name] = owner.pets
    remove_adopted_pet(pet)
  end

  def print_adoptions
    owners.each_pair do |owner, pets|
      puts "#{owner} has adopted the following pets:"
      pets.each { |pet| puts pet }
      puts "\n"
    end
  end

  def print_unadopted_pets
    puts "The Animal Shelter has the following unadopted pets: "
    Pet.pets_unadopted.each { |pet| puts pet }
    puts "\n"
  end

  def remove_adopted_pet(pet)
    Pet.pets_unadopted.delete_if { |a| a == "a #{pet.animal} named #{pet.name}"}
  end
end

# butterscotch = Pet.new('cat', 'Butterscotch')
# pudding      = Pet.new('cat', 'Pudding')
# darwin       = Pet.new('bearded dragon', 'Darwin')
# kennedy      = Pet.new('dog', 'Kennedy')
# sweetie      = Pet.new('parakeet', 'Sweetie Pie')
# molly        = Pet.new('dog', 'Molly')
# chester      = Pet.new('fish', 'Chester')

# phanson = Owner.new('P Hanson')
# bholmes = Owner.new('B Holmes')

# shelter = Shelter.new
# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.print_adoptions


# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."



# 8. Fix The Program - Expander
class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end

# expander = Expander.new('xyz')
# puts expander


# 9. Moving
module Walkable
  def walk
    "#{name} #{gait} foward."
  end
end

class Person
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

mike = Person.new("Mike")
p mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
p kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
p flash.walk
# => "Flash runs forward"

# 10. Nobility
class Noble
  include Walkable
  attr_reader :name, :title

  def initialize(name, title)
    @name = name
    @title = title
  end

  def walk
    title + ' ' + super
  end
  
  private

  def gait
    "runs"
  end

end
byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"