def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id #=> 1
  b_outer_id = b_outer.object_id #=> 2
  c_outer_id = c_outer.object_id #=> 3
  d_outer_id = d_outer.object_id #=> 4

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  # "a_outer is 42 with an id of: 1 before the block."

  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  # "b_outer is forty_two with an id of: 2 before the block."

  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  # "c_outer is [42] with an id of: 3 before the block."

  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."
  # "d_outer is 42 with an id of: 1 before the block."
  puts

  1.times do
    a_outer_inner_id = a_outer.object_id #=> 1
    b_outer_inner_id = b_outer.object_id #=> 2
    c_outer_inner_id = c_outer.object_id #=> 3
    d_outer_inner_id = d_outer.object_id #=> 1

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block."
    # "a_outer id was 1 before the block and is: 1 inside the block." SAME IDs

    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block."
    # "b_outer id was 2 before the block and is: 2 inside the block." SAME IDs

    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block."
    # "c_outer id was 3 before the block and is: 3 inside the block." SAME IDs

    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block."
    # "d_outer id was 1 before the block and is: 1 inside the block." SAME IDs
    puts

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0]

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
    # "a_outer inside after reassignment is 22 with an id of: 1 before and: 4 after." Different IDs

    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
    # "b_outer inside after reassignment is thirty three with an id of: 2 before and: 5 after." Different IDs

    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
    # "c_outer inside after reassignment is [44] with an id of: 3 before and: 6 after." Different IDs

    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
    # "d_outer inside after reassignment is 44 with an id of: 1 before and: 7 after." Different IDs
    puts


    a_inner = a_outer
    b_inner = b_outer
    c_inner = c_outer
    d_inner = c_inner[0]

    a_inner_id = a_inner.object_id #=> 4
    b_inner_id = b_inner.object_id #=> 5
    c_inner_id = c_inner.object_id #=> 6
    d_inner_id = d_inner.object_id #=> 7

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."
    # "a_inner is 22 with an id of: 4 inside the block (compared to 4 for outer)." SAME IDs

    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."
    # "a_inner is thirty three with an id of: 5 inside the block (compared to 5 for outer)." SAME IDs

    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."
    # "a_inner is [44] with an id of: 6 inside the block (compared to 6 for outer)." SAME IDs

    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer)."
    # "a_inner is 44 with an id of: 7 inside the block (compared to 7 for outer)." SAME IDs
    puts
  end

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
  # "a_outer is 22 with an id of: 1 BEFORE and: 4 AFTER the block." Different IDs

  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
  # "a_outer is thirty three with an id of: 2 BEFORE and: 5 AFTER the block." Different IDs

  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
  # "a_outer is [44] with an id of: 3 BEFORE and: 6 AFTER the block." Different IDs

  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block."
  # "a_outer is 44 with an id of: 1 BEFORE and: 7 AFTER the block." Different IDs
  puts


  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  # "ugh ohhhhh" exception raised because a_inner is not accessible in the outer scope since it was defined in the inner scope of the block after times method invocation.

  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  # "ugh ohhhhh"

  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  # "ugh ohhhhh"

  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  # "ugh ohhhhh"
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


fun_with_ids