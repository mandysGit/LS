function subtract(a, b) {
  return a - b;
}

function makeSubN(n) {
  return function(num) {
    return subtract(num, n);
  }
}

let sub5 = makeSubN(5);
console.log(sub5(10)); // 5
