# Optional Blocks

def compute
  return  yield if block_given?
  return  "Does not compute." if !block_given?
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'
