stoplight = ['green', 'yellow', 'red'].sample

case stoplight
  when 'green'
    puts "Go!"
  when 'yellow'
    puts "Slow down!"
  else
    puts "Stop!"
end

result = case stoplight
  when 'green'
    "Go!"
  when 'yellow'
    "Slow down!"
  else
    "Stop!"
end

puts result

result = case
  when stoplight == 'green'
    "Go!"
  when stoplight == 'yellow'
    "Slow down!"
  else
    "Stop!"
end

puts result

case stoplight
when 'green'  then puts 'Go!'
when 'yellow' then puts 'Slow down!'
else               puts 'Stop!'
end