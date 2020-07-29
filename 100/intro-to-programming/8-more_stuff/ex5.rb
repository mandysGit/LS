def execute(block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

# parameter in execute method is missing & 
# & ampersand sign allows a block to be passed in a parameter