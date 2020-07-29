####Hard 1 Exercises

---------------



1. 

   ```ruby 
   if true
     greeting = "hello world"
   end
   
   p greeting
   ```

   greeting is `nil`. Usually for uninitalized variable, Ruby will raise an exception, "undefined method or local variable". In this case, the local variable `greeting` is initalized within the `if` block , even if that `if` block does not get executed, the `greeting` variable is initalized to `nil` . 

   

2. 


   ```ruby 
   greetings = { a: 'hi' }
   informal_greeting = greetings[:a]
   informal_greeting << ' there'
   
   puts informal_greeting  #  => "hi there"
   puts greetings
   ```

   `informal_greeting` points to `greetings[:a]`. `informal_greetings` get mutated, so does `greetings[:a]` because they are pointing to the same object. `String#<<` is a destructive method and it mutates the caller. 

   `puts greetings` will print out `{a: 'hi there'}`

   If we did not want to modify `greetings[:a]` we can use `informal_greeting = greetings[:a].clone` or string concatenation, `informal_greeting = informal_greeting + ' there'`

   

3. 
   a) 

   ``` 
   one is one
   two is two
   three is three
   ```

   b)

   ```
   one is one
   two is two
   three is three
   ```

   c)

   ```
   one is two
   two is three
   three is one
   ```

4.

```ruby 
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.length == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end
```

