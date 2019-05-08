def scream(words)
  words = words + "!!!!"
  putsh words
end

scream("Yippeee")
#=> puts nothing
#=> explicit return exits from the method, returns nil