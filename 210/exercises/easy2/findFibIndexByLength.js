function findFibonacciIndexByLength(length) {
  let index = 2;
  let f2 = 1;
  let f1 = 1;

  while (String(f1).length < length) {
    temp = f1;
    f1 = f1 + f2;
    f2 = temp;
    index++;
  };

  return index;
}

console.log(findFibonacciIndexByLength(2));       // 7
console.log(findFibonacciIndexByLength(10));      // 45
console.log(findFibonacciIndexByLength(16));      // 74
