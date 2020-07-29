# 1. How old is Teddy?
#==========================================
def teddy_age
  age = Random.new
  puts "Teddy is #{age.rand(20..200)} years old!"
end

def name_and_age(name='Teddy')
  puts "Enter your name: "
  
  entered_name = gets.chomp
  name = entered_name.empty? ? name : entered_name
  age = Random.new

  puts "#{name} is #{age.rand(20..200)} years old!"
end

# teddy_age
# name_and_age

# 2. How big is the room?
#==========================================

def room_size
  puts "Enter the length of the room in meters: "
  length = gets.chomp.to_f
  
  puts "Enter the width of the room in meters: "
  width = gets.chomp.to_f
  
  area_sq_meters = (length*width).round(2)
  area_sq_feet = (area_sq_meters*10.7639).round(2)
  
  puts "The area of the room is #{area_sq_meters} square meters (#{area_sq_feet} square feet)."
end

####################
SQFEET_TO_SQINCHES = 144
SQFEET_TO_SQCM = 929.0304

def room_size2
  puts "Enter the length of the room in feet: "
  length = gets.chomp.to_f

  puts "Enter the width of the room in feet: "
  width = gets.chomp.to_f

  area_sq_feet = (length*width).round(2)
  area_sq_inches = (area_sq_feet*SQFEET_TO_SQINCHES).round(2)
  area_sq_cm = (area_sq_feet*SQFEET_TO_SQCM).round(2)

  puts "The area of the room is #{area_sq_feet} square feet," + \
   " ( #{area_sq_inches} square inches, and #{area_sq_cm} square centimeters)." 
end

# room_size
# room_size2

# 3. Tip calculator
#==========================================
def tip_calculator
  print "What is the bill? "
  bill_amount = gets.to_f

  print "What is the tip percentage? "
  tip_rate = gets.to_f

  tip = (bill_amount)*(tip_rate/100).round(2)
  total = (bill_amount + tip).round(2)

  puts "The tip is $#{tip}"
  puts "The total is $#{total}"
end

def tip_calculator2
  print "What is the bill? "
  bill_amount = gets.to_f

  print "What is the tip percentage? "
  tip_rate = gets.to_f

  tip = (bill_amount)*(tip_rate/100).round(2)
  total = (bill_amount + tip).round(2)

  tip = sprintf("%.2f", tip)
  total = sprintf("%.2f", total)
  puts "The tip is $#{tip}"
  puts "The total is $#{total}"
end

# tip_calculator
# tip_calculator2

# 4. When will I retire?
#==========================================
CURRENT_YEAR = Time.now.year
def retire
  print "What is your age? "
  age = gets.to_i
  print "At what age would you like to retire? "
  retire_age = gets.to_i

  years_need_to_work = retire_age - age
  puts "It's #{CURRENT_YEAR}. You will retire in #{CURRENT_YEAR + years_need_to_work}."
  puts "You have only #{years_need_to_work} of work to go!"
end

# retire

# 5. Greeting a user
#==========================================
def greeting
  print "What is your name? "
  name = gets.chomp
  
  if name.chars.last == "!"
    puts "HELLO #{name.chop.upcase}. WHY ARE YOU SCREAMING?"
  else
    puts "Hello #{name}."
  end
end

def greeting2
  print 'What is your name? '
  name = gets.chomp!

  if name[-1] == '!'
    name.chop!
    puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
  else
    puts "Hello #{name}."
  end
end 
# greeting
# greeting2

# 5. Odd Numbers
#==========================================
def odd_numbers
  for i in 1..99
    if i.odd?
      puts i
    end
  end
end

def odd_numbers2
  odds = (1..99).to_a.select {|i| i%2 != 0}
  odds.each {|i| puts i}
end

def odd_numbers3
  1.upto(99) {|i| if i.odd? then puts i end}
end

# odd_numbers
# odd_numbers2
# odd_numbers3

# 6. Even Numbers
#==========================================
def even_numbers
  for i in 1..99
    if i.even?
      puts i
    end
  end
end

def even_numbers2
  evens = (1..99).to_a.select {|i| i%2 == 0}
  evens.each {|i| puts i}
end

def even_numbers3
  1.upto(99) {|i| if i.even? then puts i end}
end

# even_numbers
# even_numbers2
# even_numbers3

# 7. Sum or Product of Consecutive Integers
#==========================================
def sum_or_product
  puts ">> Please enter an integer greater than 0:"
  max = gets.to_i

  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp

  if operation == 's'
    sum = (1..max).to_a.reduce(:+)
    puts "The sum of the integers between 1 and #{max} is #{sum}."
  elsif operation == 'p'
    product = (1..max).to_a.reduce(:*)
    puts "The product of the integers between 1 and #{max} is #{product}."
  else
    puts "unidentified operation, try again."
  end
end

# sum_or_product

# 8. String Assignment
#==========================================
=begin CODE

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

----------------------

name --> 'Bob'
saved_name --^

after applying name.upcase!
name --> 'BOB'
saved_name --^

So it prints out
#=> BOB
#=> BOB
=end 