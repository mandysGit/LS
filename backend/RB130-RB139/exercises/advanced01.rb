def fact(num)
  result = num

  loop do 
    num -= 1
    break if num <= 0
    result = result * num
  end

  result
end


factorial = Enumerator.new do |y|
  a = 1

  loop do
    y << fact(a)
    a += 1
  end
end

p e = factorial.each
puts e.next
puts e.next
puts e.next
puts e.next
puts e.next
puts e.next
puts e.next
puts e.next
puts e.next
puts e.next

factorial.rewind

factorial.each_with_index do |number, idx|
  puts number
  break if idx == 6
end
