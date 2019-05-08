arr = [1,2,3,4]

arr2 = arr.map do |num|
  num + 2
end

arr3 = []

arr.each do |num|
  arr3 << num + 2
end
p arr
p arr2
p arr3

