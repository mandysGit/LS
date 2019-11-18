# 1. Searching 101
#======================
# def prompt_message(num)
#   if num == 1
#     puts "==> Enter the #{num}st number:"
#   elsif num == 2
#     puts "==> Enter the #{num}nd number: "
#   elsif num == 3
#     puts "==> Enter the #{num}rd number: "
#   elsif num == 4 || num == 5
#     puts "==> Enter the #{num}th number: "
#   else
#     puts "==> Enter the last number: "
#   ends
# end

# def valid_number?(num)
#   num.match?(/^\d+$/)
# end

# array = []
# count = 1
# last_number = 0

# while count < 7
#   loop do
#     prompt_message(count)
#     input_number = gets.chomp

#     if valid_number?(input_number)
#       if count == 6
#         last_number = input_number.to_i
#       else
#         array << input_number.to_i
#       end

#       break
#     else
#       puts "Invalid number. Enter a number greater than 0 without decimals"
#     end
#   end

#   count += 1
# end

# if array.include?(last_number)
#   puts "The number #{last_number} appears in #{array}."
# else
#   puts "The number #{last_number} does not appear in #{array}."
# end

# 2. Arithmetic Integer
#======================
# def prompt(msg)
#   puts "==> #{msg}"
# end
# prompt("Enter the first number:")
# num1 = gets.chomp.to_i

# prompt("Enter the second number:")
# num2 = gets.chomp.to_i

# OPERATIONS = [:+, :-, :*, :/, :%, :**]

# OPERATIONS.each do |operation|
#   prompt("#{num1} #{operation} #{num2} = #{[num1, num2].inject(operation)}")
# end

# Further Exploration
OPERATIONS = [:+, :-, :*, :/, :%, :**]

def prompt(msg)
  puts "==> #{msg}"
end
prompt("Enter the first number:")
num1 = gets.chomp

num2 = ''
loop do
  prompt("Enter the second number:")
  num2 = gets.chomp
  break if num2.to_f != 0
  prompt("Only non-zero numbers are accepted.")
end

OPERATIONS.each do |operation|
  prompt("#{num1} #{operation} #{num2} = #{[num1.to_f, num2.to_f].inject(operation)}")
end
