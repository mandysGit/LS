function unshift(arr, value) {
  temp = arr.slice(0)
  arr.length = arr.length + 1;

  for (let i = 0; i < arr.length; i++) {
    if (i === 0) {
      arr[i] = value
    } else {
      arr[i] = temp[i - 1];
    }
  };

  return arr.length;
}

let unshift = function(array, value) {
  for (let index = array.length; index > 0; index -= 1) {
    array[index] = array[index - 1];
  }

  array[0] = value;
  return array.length;
};

let count = [1, 2, 3];
console.log(unshift(count, 0));      // 4
console.log(count);                  // [ 0, 1, 2, 3 ]
