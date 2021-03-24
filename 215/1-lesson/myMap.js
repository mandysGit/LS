function myMap(array, func) {
  let result = [];

  array.forEach(ele => result.push(func(ele)));

  return result;
}

let plusOne = n =>n + 1;
console.log(myMap([1, 2, 3, 4], plusOne));       // [ 2, 3, 4, 5 ]
