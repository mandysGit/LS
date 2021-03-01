function integerToString(n) {
  const DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  let result = '';

  while (n > 0) {
    let remainder = n % 10;
    n = Math.floor(n / 10);
    result = DIGITS[remainder] + result;
  };

  return result;
}

console.log(integerToString(4321));      // "4321"
console.log(integerToString(0));         // "0"
console.log(integerToString(5000));      // "5000"
