require 'pry'
=begin
# 3. Tranpose 3x3
input: 3 x 3 matrix, 2D array
output: new 2D Array, transpose of the original matrix

rules: 
- columns become rows of the new matrix

algorithm: 
- initalize transposed_matrix as empty array []
- Use input matrix's size to determine the size of the transposed_matrix
- Use Integer#times
  - (input matrix.size).times and on each iterate append [] to transposed_matrix

- Iterate through input matrix using Array#each, with variable inner_array
  - Iterate through each inner array, use Enumerable#each_with_index
    - append element of each inner_array to transpose_matrix[index]

return transposed_matrix
=end 

def transpose(matrix)
  result = []
  matrix.size.times { result << [] }

  matrix.each do |inner_array|
    inner_array.each_with_index { |num, index| result[index] << num }
  end

  result
end



# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]
# new_matrix = transpose(matrix)
# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# Further Exploration
# ====================
# def transpose!(matrix)
#   result = []
#   matrix.size.times { result << [] }

#   matrix.each do |inner_array|
#     inner_array.each_with_index { |num, index| result[index] << num }
#   end

#   counter = 0
#   until counter >= matrix.size
#     matrix[counter] = result[counter]
#     counter += 1
#   end

#   matrix
# end

# Further Exploration
# --------------------------
# 1  5  8
# 4  7  2
# 3  9  6
# Swap the elements in the first column and row (it's an upside down "L"): 
# swap 1 with 1, swap 5 with 4, swap 8 with 3.
# first iteration: 
# 1  4  3
# 5  7  2
# 8  9  6 
# Continue swapping elements in inner upside down "L" until the transpose is complete
# swap 7 with 7, swap 9 with 2
# second Iteration:
# 1  4  3
# 5  7  9
# 8  2  6 
# third Iteration:
# swap 6 with 6
# 1  4  3
# 5  7  9
# 8  2  6
# done. 

def transpose!(matrix)
  row = 0
  col = 0

  until row >= matrix.size
    until col >= matrix.size
      matrix[row][col], matrix[col][row] = matrix[col][row],  matrix[row][col]
      col += 1
    end
    
    row += 1
    col = row # increase col by 1 to tranpose inner L
  end

  matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose!(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p new_matrix.object_id == matrix.object_id


=begin
6. Fix the Bug

def my_method(array)
  if array.empty?
    []
  elsif
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

In the elsif conditional, the return value of Array#map is an array, which is truthy value. 
The Array that's returned by Array#map is evaluated in the elsif conditional. 
Then inside the elsif body returns nil because it has no code in that branch. 

Like so: 

  if array.empty?
    []
  elsif (array.map do |value| value * value end)
  else
    [7 * array.first]
  end
=end

def my_method(array)
  if array.empty?
    []
  elsif array.length == 1
    [7 * array.first]
  else
    array.map do |value|
      value * value
    end 
  end
end

# p my_method([])
# p my_method([3])
# p my_method([3, 4])
# p my_method([5, 6, 7])