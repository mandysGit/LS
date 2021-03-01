function signedIntegerToString(n) {
  if (n < 0) return `-${integerToString(n * -1)}`;
  if (n > 0) return `+${integerToString(n)}`;
  return '0';
}

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

console.log(signedIntegerToString(4321));      // "+4321"
console.log(signedIntegerToString(-123));      // "-123"
console.log(signedIntegerToString(0));         // "0"
