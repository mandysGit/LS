function sum(arr) {
  return arr.reduce((acc, current) => acc + current);
}
function sumOfSums(arr) {
  let temp = [];
  let result = [];

  arr.forEach(n => {
    temp.push(n);
    result.push(sum(temp));
  })

  return sum(result);
}

console.log(sumOfSums([3, 5, 2]));        // (3) + (3 + 5) + (3 + 5 + 2) --> 21
console.log(sumOfSums([1, 5, 7, 3]));     // (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) --> 36
console.log(sumOfSums([4]));              // 4
console.log(sumOfSums([1, 2, 3, 4, 5]));  // 35
