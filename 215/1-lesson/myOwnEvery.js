function myOwnEvery(array, func) {
  array.forEach(ele => {
    if (!func(ele)) return false;
  })

  return true;
}

function myOwnEvery(array, func) {
  for (let i = 0; i < array.length; i += 1) {
    if (!func(array[i])) {
      return false;
    }
  }

  return true;
}

// If your code needs an early return while processing a list, consider using a for loop. The JavaScript list processing abstractions, other than every and some, all traverse the entire list, and that may be wasted effort.
let isAString = value => typeof value === 'string';
console.log(myOwnEvery(['a', 'a234', '1abc'], isAString));       // true
