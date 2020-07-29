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

return: 

```ruby
{'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}
```

`each_with_object` takes in an object as an argument. In this case `{}` was passed in as an argument. 

`each_with_object` iterates each element of the calling collection, and in the first iteration, `value[0]` is `a` and value is `'ant'` , we assign `a` as the key and `ant` as the value to the hash object. 

After iterating the calling collection, the hash object is now populated like this: `{'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}` and is the return value of `each_with_object` . The `each_with_object` method returns the initial obj argument that was passed it, whether it was mutated or not. 

5.

```ruby
hash = { a: 'ant', b: 'bear' }
hash.shift
```

output: 

```ruby
['a', 'ant']
```

Hash#shift removes a the first key-value pair and returns the key value in a two-item array [key, value]. This method mutates the caller. `hash` is modified, `{ b: 'bear' }`

6.

```ruby
['ant', 'bear', 'caterpillar'].pop.size
```

output: 

```ruby
11
```

First the Array#pop method destructively removes and returns the last element of the calling array. Due to method chaining, `caterpillar` is the String object that gets returned, and `caterpilar` string calls String#size method. It will return 11 because that is how many letters there are in `caterpillar`. 

7.

```ruby
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
```

output

```ruby
1
=> true
```

The block's return value is the last line of the block. The last line is `num.odd?` , which returns a boolean. The return value will become evaluated as "truthy" or "falsey". It is determined by the "truthiness", anything that is returned and is not `nil` or `false` is "truthy". 

Thus if the block returns a single "truthy" value, then `any?` method will return true. Otherwise, if the block only returns "falsey" values, the `any?` method will return false. 

`any?` stops iterating once it reaches an iteration that returns a "truthy" value. That's why `puts num` only invokved once and prints out 1. The first element is odd, so `any?` stops iterating after that point. 

8.

```ruby
arr = [1, 2, 3, 4, 5]
arr.take(2)
```

Returns the first _n_ elements from the array as a new array. This method is not destructive and does not mutate the caller Array. 

9.

```ruby
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
```

output

```ruby
=> [nil, "bear"]
```

Enumerable#map returns a new array with the results of running block once for every element in the collection. This method does transformation. In the first iteration of the block, `"ant".size` is not greater than 3, so it returns `nil`. In the second iteration, `"bear".size` is greater than 3, so it returns `"bear"`.

When none of the conditions in an `if` statement evaluates as `true`, the `if` statement itself returns `nil`. 

10.

```ruby
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
```

output:

```ruby
[1, nil, nil]
```

Enumberable#map returns a new array with the results of running the block once for every element in the collection. The first iteration, 1 is not greater than 1, so it returns 1. In the second and third iteration, 2 and 3 are greater than 1, so it invokes `puts num`, and `puts` method returns nil. Therefore, the new array that `map` returns is `[1, nil, nil]` 