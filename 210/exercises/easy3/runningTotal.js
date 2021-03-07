function runningTotal(arr) {
  let totals = [];

  arr.reduce((acc, current) => {
    acc += current;
    totals.push(acc);
    return acc;
  }, 0);

  return totals;
}

// Further Exploration
function runningTotal(arr) {
  let sums = [];
  return arr.map(number => {
    sums.push(number);
    return sums.reduce((acc, current) => acc + current);
  });
}

console.log(runningTotal([2, 5, 13]));             // [2, 7, 20]
console.log(runningTotal([14, 11, 7, 15, 20]));    // [14, 25, 32, 47, 67]
console.log(runningTotal([3]));                    // [3]
console.log(runningTotal([]));                     // []

