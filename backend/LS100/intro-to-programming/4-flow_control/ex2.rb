def all_caps(str)
  (str.length > 10) ? str.upcase : str
end

puts all_caps('hello')
puts all_caps('hellooooooooooo')