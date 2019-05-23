# ask the user for two numbers
# ask the user for an opereation to perform
# perform the operation on the two numbers
# output the result

Kernel.puts("Welcome to Caculator!")

Kernel.puts("What's the first number?")
number1 = Kernel.gets()

Kernel.puts("What's the first number?")
number2 = Kernel.gets()

Kernel.puts("What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide")
operator = Kernel.gets().chomp()

Kernel.puts(number1)
Kernel.puts(number2)

if operator == '1'
  result = number1.to_i() + number2.to_i()
elsif operator == '2'
  result = number1.to_i() - number2.to_i()
elsif operator == '3'
  result = number1.to_i() * number2.to_i()
else
  result = number1.to_f() / number2.to_f()
end

Kernel.puts("The result is #{result}")