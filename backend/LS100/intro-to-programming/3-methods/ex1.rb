def greeting1(name)
  "Greetings, #{name}"
end 

def greeting2(name)
  "Greetings, " + name
end

puts greeting1('bob')

puts greeting2('alice')