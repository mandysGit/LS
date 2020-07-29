result = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].select do |n|
  n % 2 != 0 
end

p result

result2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].select {|n| n % 2 != 0}

p result2