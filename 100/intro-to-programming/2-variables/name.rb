print "What is your name first name? "
first_name = gets.chomp

print "What is your name last name? "
last_name = gets.chomp

puts "Grettings, #{first_name} #{last_name}"

# Integer#times
10.times { puts first_name + ' ' + last_name }

10.times do
  puts first_name + ' ' + last_name
end
