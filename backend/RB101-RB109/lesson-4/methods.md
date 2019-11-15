#### Methods

-------------------

1.

```ruby
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
```

The `return` value of the `select` method is `[1, 2, 3]` . The `select` method considers the return value of the block, it considers the "truthiness" value. Since `"hi"` is "truthy", the block will return a "truthy" value for every iteration of the block . The `select` method returns a _new collection_ or _new array_ by selecting all the elements of the original array because for each iteration, the blocked returned "truthy". 


2.

```ruby
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
```

The `count` method considers the return value of the block. The method counts the number of times the block returns true, otherwise it doesn't count if it's not true. Therefore, it considers the _turthiness_ of the block's return value.


3.

```ruby
[1, 2, 3].reject do |num|
  puts num
end
```

The `reject` method here will return [1, 2, 3]. `Enumerable#reject` returns an _new array_ containing all the elements of the collection where the block's return value is "falsey". Since `puts num` returns `nil`, that is "falsey" and therefore returned a _new array_ containing all the elements. 

The `reject` method considers the "truthy" or "falsey" return value of the block. If the block returned "truthy" value, then the `reject` method would have returned an empty array but in this case, it returned "falsey" value, thus returning the original array. 

4.

```ruby
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
```

