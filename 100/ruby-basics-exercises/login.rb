PASSWORD = "secreT"
USERNAME = "admin"

loop do
  puts ">> Please enter your user name:"
  username = gets.chomp

  puts ">> Please enter your password:"
  password = gets.chomp

  break if password == PASSWORD && username == USERNAME
  puts "Authorization failed"
end

puts "Welcome!"