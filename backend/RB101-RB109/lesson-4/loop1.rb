# 1.
# loop do
#   puts 'Just keep printing...'
#   break
# end

# 2.
# loop do
#   puts 'This is the outer loop.'

#   loop do
#     puts 'This is the inner loop.'
#     break
#   end

#   break
# end

# puts 'This is outside all loops.'

# 3.

# iterations = 1

# loop do
#   puts "Number of iterations = #{iterations}"
#   iterations += 1
#   break if iterations > 5
# end

# # Further Exploration

# iterations = 1

# loop do
#   puts "Number of iterations = #{iterations}"
#   break if iterations > 4
#   iterations += 1
# end

# 4.

# loop do
#   puts 'Should I stop looping?'
#   answer = gets.chomp
#   break if answer == 'yes'
# end

# 5.

# say_hello = true
# count = 0

# while say_hello
#   puts 'Hello!'
#   count += 1
#   if count > 5
#     say_hello = false
#   end
# end

# while say_hello
#   puts 'Hello!'
#   count += 1
#   say_hello = false if count == 5
# end

# 6.

# count = 0

# while count < 5
#   puts Random.new.rand(0..99)
#   count += 1
# end

# numbers = []

# while numbers.length < 5
#   random_num = Random.new.rand(0..99)
#   numbers << random_num
# end

# puts numbers

# numbers = []

# while numbers.length < 5
#   numbers << rand(100)
# end

# puts numbers

# 7.
# count = 1

# until count == 11
#   puts count
#   count += 1
# end

# 8.
# numbers = [7, 9, 13, 25, 18]
# index = 0

# until index == numbers.size
#   puts numbers[index]
#   index += 1
# end

# 9.
# for i in 1..100
#   puts i if i.odd?
# end

# 10.
# friends = ['Sarah', 'John', 'Hannah', 'Dave']

# for friend in friends
#   puts "Hi, #{friend}!"
# end