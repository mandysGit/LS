[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].each do |n|
  if n > 5
    puts n
  end
end

[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].each {|n| puts n if n > 5}