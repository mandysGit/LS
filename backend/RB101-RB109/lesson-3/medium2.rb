def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id #=> 1
  b_outer_id = b_outer.object_id #=> 2
  c_outer_id = c_outer.object_id #=> 3
  d_outer_id = d_outer.object_id #=> 4

  # Correct
  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block." #=> 42,        1
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block." #=> forty two, 2
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block." #=> [42],      3
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block." #=> 41,        1
  puts

  1.times do
    a_outer_inner_id = a_outer.object_id #=> 1
    b_outer_inner_id = b_outer.object_id #=> 2
    c_outer_inner_id = c_outer.object_id #=> 3
    d_outer_inner_id = d_outer.object_id #=> 1

    # Correct
    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block." #=> 1, 1
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block." #=> 2, 2
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block." #=> 3, 3
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block." #=> 1, 1
    puts

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0]

    # Correct
    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after." #=> 22,           1, 4
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after." #=> thirty three, 2, 5
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after." #=> [44],         3, 6
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after." #=> 44,           1, 7
    puts


    a_inner = a_outer
    b_inner = b_outer
    c_inner = c_outer
    d_inner = c_inner[0]

    a_inner_id = a_inner.object_id #=> 4
    b_inner_id = b_inner.object_id #=> 5
    c_inner_id = c_inner.object_id #=> 6
    d_inner_id = d_inner.object_id #=> 7

    # Correct
    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)." #=> 22,           4, 4
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)." #=> thirty three, 5, 5
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)." #=> [44],         6, 6
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer)." #=> 44,           7, 7
    puts
  end

  # Correct
  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block." #=> 22,           1, 4
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block." #=> thirty three, 2, 5
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block." #=> [44],         4, 6
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block." #=> 44,           1, 7
  puts

  # Correct
  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh" # "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh" # "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh" # "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh" # "ugh ohhhhh"
end

# fun_with_ids

# 2.

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id #=> 1
  b_outer_id = b_outer.object_id #=> 2
  c_outer_id = c_outer.object_id #=> 3
  d_outer_id = d_outer.object_id #=> 1

  # Correct
  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block." #=> 42,        1
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block." #=> forty two, 2
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block." #=> [42],      3
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block." #=> 42,        1
  puts

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)

  # Correct
  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call." #=> 42,       1, 1
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call." #=> fortytwo, 2, 2
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call." #=> [42],     3, 3
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call." #=> 42,       1, 1
  puts

  # Correct
  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh" #=> "ugh ohhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh" #=> "ugh ohhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh" #=> "ugh ohhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh" #=> "ugh ohhhh"
  puts
end


def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)
  a_outer_inner_id = a_outer.object_id #=> 1
  b_outer_inner_id = b_outer.object_id #=> 2
  c_outer_inner_id = c_outer.object_id #=> 3
  d_outer_inner_id = d_outer.object_id #=> 1

  # Correct
  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method." #=> 1, 1
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method." #=> 2, 2
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method." #=> 3 ,3
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method." #=> 1, 1
  puts

  a_outer = 22
  b_outer = "thirty three"
  c_outer = [44]
  d_outer = c_outer[0]

  # Correct
  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after." #=> 22,           1, 4
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after." #=> thrity three, 2, 5
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after." #=> [44],         3, 6
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after." #=>  44,          1, 7
  puts

  a_inner = a_outer #=> 22
  b_inner = b_outer #=> "thirty three"
  c_inner = c_outer #=> [44]
  d_inner = c_inner[0] #=> 44

  a_inner_id = a_inner.object_id #=> 4
  b_inner_id = b_inner.object_id #=> 5
  c_inner_id = c_inner.object_id #=> 6
  d_inner_id = d_inner.object_id #=> 7

  # Correct
  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)." #=> 22,            4,4
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)." #=> thirty three.  5,5
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)." #=> [44]           6,6
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer)." #=> 44             7,7
  puts
end

# fun_with_ids

# 3.

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" #=> "pumpkins"
puts "My array looks like this now: #{my_array}" #=> ["pumpkins", "rutabaga"]

=begin
my_string is passed to the tricky_method as an arugment. Inside the tricky method, a_string_param paramater variable references the same String Object as my_string variable, and that String Object has the value "pumpkins". Inside the tricky method, a_string_param gets reassigned to a new String Object `a_string_param = a_string_param + "rutaga"`. a_string_param now references "pumpkinsrutabaga". This reassignment does not modify the my_string vairable and what it points it. It only modifies the method's local variable a_string_param and makes it reference a new String Object. Thus, the print statement outputs "pumpkins" for my_string, because the method did not mutate my_string.

my_array is passed to the tricky_method as an argument. Inside the tricky method, an_array_param parameter references the same String Object as my_array variable, and that Array Object has the value ["pumpkins"].
an_array_param calls Array#<< method to append "rutabaga" to the last position of the array. This mutates/modifies the Array object that both an_array_param and my_array references to. Thus, the print statement outputs ["pumpkins", "rutabaga"] for my_array.
=end

# 4.