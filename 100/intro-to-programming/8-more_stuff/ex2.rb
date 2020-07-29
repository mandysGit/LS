def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

# program will NOT print "Hello from inside the execute method"
# block was not called, it should be "block.call" in order to execute the block
# method returns a Proc object