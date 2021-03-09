function negative(num) {
  return -Math.abs(num);
}

function negative(num) {
  let result = num < 0 ? num : -num;
  return result;
}
console.log(negative(5));     // -5
console.log(negative(-3));    // -3
console.log(negative(0));     // -0
