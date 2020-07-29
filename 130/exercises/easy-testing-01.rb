assert value.odd?, 'value is not odd' 

#assert tests whether the first argument is truthy, if it's truthy, it passes the test
# If it's falsey, it fails the test and outputs the second argument

# if you want to know your method returns exactly true then use assert_equal
assert_equal true, value.odd?
