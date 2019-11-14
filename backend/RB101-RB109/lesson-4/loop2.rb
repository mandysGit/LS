# 1.
# count = 1

# loop do
#   puts "#{count} is odd!" if count.even?
#   puts "#{count} is even!" if count.odd?

#   count += 1
#   break if count > 5
# end

# 2.
# loop do
#   number = rand(100)
#   puts number
#   break if (0..10).include?(number)
# end

# loop do
#   number = rand(100)
#   puts number

#   if number.between?(0, 10)
#     break
#   end
# end

# 3.
# process_the_loop = [true, false].sample

# loop do
#   puts "The loop was processed!" if process_the_loop
#   puts "The loop wasn't processed!" if !process_the_loop
#   break
# end

# if process_the_loop
#   loop do
#     puts "The loop was processed!"
#     break
#   end
# else
#   puts "The loop wasn't processed!"
# end

# 4.
# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.chomp.to_i

#   if answer == 4
#     puts "That's correct!"
#     break
#   end

#   puts "Wrong answer. Try again!"
# end

# 5.
# numbers = []

# loop do
#   break if numbers.size == 5

#   puts 'Enter any number:'
#   input = gets.chomp.to_i
#   numbers << input
# end
# puts numbers

# 6.
# names = ['Sally', 'Joe', 'Lisa', 'Henry']

# loop do
#   puts names.shift
#   break if names.size == 0
# end

# loop do
#   puts names.pop
#   break if names.size == 0
# end

# 7.
# 5.times do |index|
#   puts index
#   break if index == 2
# end

# 8.
# number = 0

# until number == 10
#   number += 1
#   next if number.odd?
#   puts number
# end

# 9.
# number_a = 0
# number_b = 0

# loop do
#   number_a += rand(2)
#   number_b += rand(2)
#   next unless number_a == 5 || number_b == 5
#   puts "5 was reached!"
#   break
# end

# number_a = 0
# number_b = 0

# loop do
#   number_a += rand(2)
#   number_b += rand(2)
#   if number_a == 5 || number_b == 5
#     puts "5 was reached!"
#   else
#     next
#   end

#   break
# end

# 10.

# def greeting
#   puts 'Hello!'
# end

# number_of_greetings = 2

# while number_of_greetings > 0
#   greeting
#   number_of_greetings -= 1
# end