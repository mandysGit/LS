# Optional Blocks

#def compute
#  return  yield if block_given?
#  return  "Does not compute." if !block_given?
#end
#
# compute { 5 + 3 } == 8
# compute { 'a' + 'b' } == 'ab'
# compute == 'Does not compute.'

# Further Exploration

def compute(arg)
  return 'Does not compute.' unless block_given?
  yield(arg)
end

p compute(5) { |num| num + 3 } == 8
p compute('a') { |num| num + 'b' } == 'ab'
p compute(5) == 'Does not compute.'
