function originalReverse(arr) {
  let arr1 = arr.slice(0)
  return arr1.concat(arr.reverse());
}

let digits = [4, 8, 15, 16, 23, 42];

console.log(originalReverse(digits));
