function concat(...args) {
  let result = [];

  for (let argument of args) {
    if (Array.isArray(argument)) {
      for (let ele of argument) {
        result.push(ele);
      };
    } else {
      result.push(argument);
    }
  };

  return result;
}

console.log(concat([1, 2, 3], [4, 5, 6], [7, 8, 9]));    // [1, 2, 3, 4, 5, 6, 7, 8, 9]
console.log(concat([1, 2], 'a', ['one', 'two']));        // [1, 2, "a", "one", "two"]
console.log(concat([1, 2], ['three'], 4));               // [1, 2, "three", 4]
