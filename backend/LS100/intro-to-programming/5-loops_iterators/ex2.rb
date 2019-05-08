sentence = ''

while sentence != 'STOP' do
  puts "Print a sentence or type 'STOP'"
  sentence = gets.chomp
  puts "your sentence is: #{sentence}"
end

name = ''

until name == 'STOP' do
  puts "Greetings, #{name}!"
  puts "What is your name? "
  name = gets.chomp
end