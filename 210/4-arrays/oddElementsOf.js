function oddElementsOf(arr) {
  return arr.filter((ele, index) => index % 2 !== 0);
}

let digits = [4, 8, 15, 16, 23, 42];

console.log(oddElementsOf(digits));    // returns [8, 16, 42]
