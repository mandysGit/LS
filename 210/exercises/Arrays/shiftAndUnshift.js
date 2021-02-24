function shift(arr) {
  if (arr.length === 0) return undefined;
  let copy = arr.slice(1);
  let firstEle = arr[0];

  arr.length = arr.length - 1;
  for (let i = 0; i < arr.length; i++) {
    arr[i] = copy[i];
  };

  return firstEle;
}

function unshift(arr, ...args) {
  let copy = args.concat(arr.slice(0));

  for (let i = 0; i < copy.length; i++) {
    arr[i] = copy[i];
  };

  return arr.length;
}

function unshift(array, ...args) {
  for (let i = 0; i < args.length; i += 1) {
    array.splice(i , 0, args[i]);
  }

  return array.length;
}
console.log(shift([1, 2, 3]));                // 1
console.log(shift([]));                       // undefined
console.log(shift([[1, 2, 3], 4, 5]));        // [1, 2, 3]

console.log(unshift([1, 2, 3], 5, 6));        // 5
console.log(unshift([1, 2, 3]));              // 3
console.log(unshift([4, 5], [1, 2, 3]));      // 3

const testArray = [1, 2, 3];
console.log(shift(testArray));                // 1
console.log(testArray);                       // [2, 3]
console.log(unshift(testArray, 5));           // 3
console.log(testArray);                       // [5, 2, 3]
