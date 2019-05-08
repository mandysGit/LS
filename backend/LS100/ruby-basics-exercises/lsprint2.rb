number_of_lines = nil

loop do
  puts '>> How many output lines do you want? Enter a number >= 3:'
  number_of_lines = gets.chomp
  break if number_of_lines == 'q' || number_of_lines == 'Q'

  if number_of_lines.to_i < 3
    puts ">> That's not enough lines." 
  else 
    number_of_lines.to_i.times {puts 'Launch School is the best!'}
  end
end