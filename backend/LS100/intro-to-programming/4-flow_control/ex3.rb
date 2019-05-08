puts "enter a number between 0 to 100"
num = gets.chomp.to_i

def evaluate_num(num)
  case num
  when (-1.0/0)..-1
    puts "you can't enter a negative number!"
  when 0..50 
    puts "#{num}, your number is between 0 and 50"
  when 51..100
    puts "#{num}, your number is between 51 and 100"
  else
    puts "#{num}, your number is above 100"
  end
end

def evaluate_num_second_method(number)
  case
  when number < 0
    puts "You can't enter a negative number!"
  when number <= 50
    puts "#{number} is between 0 and 50"
  when number <= 100
    puts "#{number} is between 51 and 100"
  else
    puts "#{number} is above 100"
  end
end

def evaluate_num_third_method(number)
  case number
  when 0..50
    puts "#{number} is between 0 and 50"
  when 51..100
    puts "#{number} is between 51 and 100"
  else
    if number < 0
      puts "You can't enter a negative number!"
    else
      puts "#{number} is above 100"
    end
  end
end

evaluate_num(num)
evaluate_num_second_method(num)
evaluate_num_third_method(num)


# Ranges constructed using .. run from the beginning to the end inclusively.
# Those created using ... exclude the end value
