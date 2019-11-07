# 1.
# numbers = [1, 2, 2, 3]
# numbers.uniq
# puts numbers

# It will print out
# 1
# 2
# 2
# 3

# because Array#uniq does not mutate the caller, Array#uniqu did not modify the numbers Object, the object that numbers variable points to. Instead it returned a new Array with unqiue elements.


# The puts method
# --------------
# If called with an array argument, it writes each element on a new line. If the given object is not a string or array, it will be converted by calling it's to_s method

# The p method
# ------------
# Calls obj.inspect on its argument.

# The inspect method
# ------------------
# Ex. Array#inspect, Integer#inspect, Object#inspect...
# Returns a string containing a human-readable representation of obj.