# Zipper

def zip(arr1, arr2)
  index = 0
  result = []

  while index < arr1.size
    result << [arr1[index], arr2[index]]
    index += 1
  end

  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

