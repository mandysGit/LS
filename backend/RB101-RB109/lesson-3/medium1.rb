# 1.
# 10.times {|n| puts "Flintstones Rock!".prepend(" " *n)}

#2.
# Cannot concatenate an Integer with a String. It will result in TypeError (no implicit conversion of Integer into String)

# result = 40 + 2
# puts "the value of 40 + 2 is #{result}"
# puts "the value of 40 + 2 is " + result.to_s

#3.

def factors(number)
  divisor = number
  factors = []
  loop do
    break if divisor <= 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(0)