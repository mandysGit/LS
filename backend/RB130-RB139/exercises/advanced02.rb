# Group 1
puts '--------group 1: Proc--------'
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# Group 2
puts
puts '------lambda----------'
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }

puts my_lambda
puts my_second_lambda
puts my_lambda.class

my_lambda.call('dog')
# my_lambda.call
#my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# Group 3
puts
puts '------blocks------'
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# Group 4
puts 
puts '------Group 4: blocks-------'
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

=begin
Group 1: Procs
- calling to_s on a proc object returns the Proc object encoding
- #<Proc:0x00007f9ad41447d8@advanced02.rb:3>
- proc object's class is Proc
- If no arguments are passed to the Proc object when invoked, then nil is passed. #{nil} is empty string

Group 2: Lambdas
- Two ways to create a lambda:
- lamda {...}
- -> {...}
- calling to_s on a lambda returns a Proc object encoding with (lambda) 
- #<Proc:0x00007f9ad4144468@advanced02.rb:12 (lambda)>
- lambda is an instance of Proc
- cannot invoke a lambda if there isn't the right amount of arguments, Argument Error
- cannot instantiate using "Lambda.new" 

Group 3: Blocks
- If there's a yield keyword inside the method, and there's no block argument passed to the method at method invocation, "no block given (yield) LocalJumpError" will be raised
- If there's no argument passed into yield, even though the block is expecting an argument, it will point the block's argument to nil, and #{nil} will return empty string

Group 4: Blocks
- If there's variable referenced from the block that is not around | | then it will be undefined local variable
=end
