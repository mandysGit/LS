function pop(arr) {
  let last = arr[arr.length - 1];
  arr.length = arr.length - 1;
  return last;
}

let count2 = [1, 2, 3];
console.log(pop(count2));             // 3
console.log(count2);                  // [ 1, 2 ]


