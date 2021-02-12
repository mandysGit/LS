function concat(arr1, arr2) {
  let newArr = [];
  for (let i = 0; i < arr1.length; i++) {
    push(newArr, arr1[i]);
  };

  for (let i = 0; i < arr1.length; i++) {
    push(newArr, arr2[i]);
  };

  return newArr;
}

function push(arr, value) {
  arr[arr.length] = value;
  return arr.length;
}
console.log(concat([1, 2, 3], [4, 5, 6]));       // [ 1, 2, 3, 4, 5, 6 ]
