#1)
class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# balance in positive_balance? is a getter and will return the value of @balance
# There's no need to add @ infront of balance, because there's an attr_reader :balance

#2)
class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

# The mistake is that quatity should be self.quantity = updated_count if updated_count >= 0
# We need to add a attr_accessor :quatity

#3)
# Change attr_accessor :quatity, and this could be under private keyword to protect outside
# code from changing it
# Leave attr_reader :product_name

#4)
class Greeting
  def greet(msg)
    puts "#{msg}"
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

#5)
class KrispyKreme
  def initialize(filling_type, glazing)
    @filling_type = filling_type || "Plain"
    @glazing = glazing
  end

  def to_s
    return "#{filling_type} with #{glazing}" if glazing
    "#{filling_type}"
  end

  private

  attr_reader :filling_type, :glazing
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")


puts donut1
puts donut2
puts donut3
puts donut4
puts donut5

#6)
class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

=begin
The difference is the use of `self`.
The first example uses @template to access the instance variable and reassign it to
"template 14231".

The second example uses self.template to reassign the instance variable. That's possible
because the setter for @tempalte is defined via attr_accesor :template

Same thing with getting the @template instance variable.
First example uses the getter method defined by attr_accessor :template,
second example uses the self.template.

General Ruby style guid erule is "Avoid self where not required"
=end


#7)
class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.info
    "I want to turn on the light with a brightness level of super high and a colour of green"
  end

end
