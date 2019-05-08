
puts ">> How many output lines do you want? Enger a number >= 3: "
number = gets.chomp.to_i

while number < 3
  puts "That's not enough lines."
  puts ">> How many output lines do you want? Enger a number >= 3: "
  number = gets.chomp.to_i
end 

number.times do
  puts "Launch School is the best!"
end
