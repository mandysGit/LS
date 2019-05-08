# numerator = nil
# denominator = nil

# def valid_number?(number_string)
#   number_string.to_i.to_s == number_string
# end

# loop do
#   puts ">> Please enter numerator:"
#   numerator = gets.chomp

#   unless valid_number?(numerator)
#     puts ">> Invalid input. Only integers are allowed" 
#     next
#   end

#   break 
# end

# loop do
#   puts ">> Please enter the denominator:"
#   denominator = gets.chomp
  
#   unless valid_number?(denominator)
#     puts ">> Invalid input. Only integers are allowed" 
#     next
#   end

#   if denominator == '0'
#     puts "Invlaid input. A denominator of 0 is not allowed."
#     next
#   end

#   break
# end 

  
# puts ">> #{numerator}/#{denominator} is #{numerator.to_i/denominator.to_i}"


################################################################################

numerator = nil
denominator = nil

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

loop do
  puts ">> Please enter numerator:"
  numerator = gets.chomp

  break if valid_number?(numerator)
  puts ">> Invalid input. Only integers are allowed" 
end

loop do
  puts ">> Please enter the denominator:"
  denominator = gets.chomp

  if denominator == '0'
    puts "Invlaid input. A denominator of 0 is not allowed."
  else
    break if valid_number?(denominator)
    puts ">> Invalid input. Only integers are allowed" 
  end
end 
  
puts ">> #{numerator}/#{denominator} is #{numerator.to_i/denominator.to_i}"


