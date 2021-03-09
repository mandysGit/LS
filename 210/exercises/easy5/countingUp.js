function sequence(num) {
  let count = 1;
  let result = [];
  while (count < num) {
    result.push(count);
    count++;
  }

  return result;
}
console.log(sequence(5));    // [1, 2, 3, 4, 5]
console.log(sequence(3));    // [1, 2, 3]
console.log(sequence(1));    // [1]
