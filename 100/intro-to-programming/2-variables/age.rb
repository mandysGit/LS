print "How old are you? "

age = gets.chomp.to_i
years = 10

4.times do
  puts "In #{years} years you will be:"
  new_age = years + age

  puts new_age
  years = years + 10
end

puts "----------"
print "How old are you? "
age = gets.chomp

puts "In 10 years you wil be: "
puts age.to_i + 10

puts "In 20 years you wil be: "
puts age.to_i + 20

puts "In 30 years you wil be: "
puts age.to_i + 30

puts "In 40 years you wil be: "
puts age.to_i + 40