Kernel.puts "Enter first number: "
num1 = Kernel.gets().chomp().to_i

Kernel.puts "Enter second number: "
num2 = Kernel.gets().chomp().to_i

Kernel.puts "What operation do you want to perform? (add, subtract, multiply, or divide): "
user_operation = Kernel.gets().chomp().to_sym


if (num2 == 0) && (user_operation == :divide)
  Kernel.puts "Cannot divide #{num1} by zero."
else 
  operations = {
    add: :+,
    subtract: :-,
    multiply: :*,
    divide: :/
  }

  result = user_operation == :divide ?
    num1.to_f.send(operations[user_operation], num2.to_f) :
    num1.send(operations[user_operation], num2)

  Kernel.puts "#{num1} #{user_operation} #{num2} is #{result}"
end 
