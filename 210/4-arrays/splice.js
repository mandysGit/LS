function splice(arr, start, length) {
  let extracted = [];
  let temp = [];
  let count = 0;
  let index = start;

  while (count < length) {
    push(extracted, arr[index]);
    arr[index] = undefined;
    count++;
    index++;
  };

  for (let n of arr) {
    if (typeof n !== 'undefined') push(temp, n);
  };

  arr.length = temp.length;

  for (let i = 0; i < arr.length; i++) {
    arr[i] = temp[i];
  };

  return extracted;
}

function push(arr, value) {
  arr[arr.length] = value;
  return arr.length;
}

let count = [1, 2, 3, 4, 5, 6, 7, 8];
console.log(splice(count, 2, 5));                   // [ 3, 4, 5, 6, 7 ]
console.log(count);                                 // [ 1, 2, 8 ]
