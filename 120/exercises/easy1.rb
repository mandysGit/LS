# 1. Banner Class
class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  attr_reader :message

  def horizontal_rule
    "+-#{'-'*message.length}-+"
  end

  def empty_line
    "| #{' '*message.length} |"
  end

  def message_line
    "| #{message} |"
  end
end

# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+


# banner = Banner.new('')
# puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

# Further Exploration
class Banner
  def initialize(message, width=60)
    @message = message
    @width = width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  attr_reader :message, :width

  def horizontal_rule
    "+-#{'-'*width}-+"
  end

  def empty_line
    "| #{' '*width} |"
  end

  def message_line
    "| " + message.center(width) +  " |"
  end
end

# banner = Banner.new('To boldly go where no one has gone before.', 80)
# puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+


# banner = Banner.new('')
# puts banner
# +--+
# |  |
# |  |
# |  |
# +--+


# 2. 
class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

name = 42
fluffy = Pet.new(name)
name += 1 # name is reassigned name = 42 + 1

# String#to_s converts 42 to String '42', therefore
# upcase is called on the String '42' on the expression @name.upcase
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name


# 3. Fix the Program - Books (Part 1)
# class Book
#   attr_reader :title, :author

#   def initialize(author, title)
#     @author = author
#     @title = title
#   end

#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new("Neil Stephenson", "Snow Crash")
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)

=begin Further Exploration
We use attr_reader instead of attr_writer or attr_accessor is because
we only wnat to retrieve the title and author, we don't want to reassign it. 
Therefore, we only need a getter and not a setting method, attr_reader gives us
a getter method to retrieve @author and @title instance variables.
=end


# 4. Fix the Program - Books (Part 2)
class Book
  attr_accessor :title, :author

  def to_s
    %("#{title}", by #{author})
  end
end

# book = Book.new
# book.author = "Neil Stephenson"
# book.title = "Snow Crash"
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)

# 5. Fix the Program Persons
class Person
  def initialize(first_name, last_name)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
  end

  def to_s
    "#{@first_name} #{@last_name}"
  end

  def first_name=(name)
    @first_name = name.capitalize
  end

  def last_name=(name)
    @last_name = name.capitalize
  end
end

# person = Person.new('john', 'doe')
# puts person

# person.first_name = 'jane'
# person.last_name = 'smith'
# puts person

# 6. Fix the Program - Flight Data
class Flight
  attr_accessor :database_handle # Remove this line

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

=begin
We don't want easy access to our database in this class. If we decide to
not use the database in the future, and this class is already 
modifying the database, it will be very difficult to remove because there's a depdency on it. 

In otherwords, 
Once that database handle is being used in real code, 
future modifications to the class may break that code.
You may even be prevented from modifying your class at all
if the dependent code is of greater concern.
=end

# 7. Buggy Code - Car Mileage
class Car
  attr_accessor :mileage

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    total = mileage + miles
    self.mileage = total
  end

  def print_mileage
    puts mileage
  end
end

# car = Car.new
# car.mileage = 5000
# car.increment_mileage(678)
# car.print_mileage  # should print 5678

# 8. Rectangles and Squares
class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle
  def initialize(side)
    super(side, side)
  end
end

# square = Square.new(5)
# puts "area of square = #{square.area}"

# 9. Complete the Program - Cats!
class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  attr_reader :name, :age, :color

  def initialize(name, age, color)
    super(name, age)
    @color = color
  end

  def to_s
    "My cat #{name} is #{age} years old and has #{color} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch


# 10. Refactoring Vehicles
class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end
