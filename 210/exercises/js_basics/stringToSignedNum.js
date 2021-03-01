function stringToSignedInteger(str) {
  let cleanStr = str;
  if (str[0] === '-' || str[0] === '+') cleanStr = str.split('').slice(1).join('');
  if (str[0] === '-') return -1 * stringToInteger(cleanStr);
  return stringToInteger(cleanStr);
}

function stringToSignedInteger(string) {
  switch (string[0]) {
    case '-': return -stringToInteger(string.slice(1));
    case '+': return stringToInteger(string.slice(1));
    default:  return stringToInteger(string);
  }
}

function stringToInteger(str) {
  let nums = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  let result = 0;

  for (let i = 0; i < str.length; i++) {
    let num = nums.indexOf(str[i]);
    let multiple = 10**(str.length - i - 1);
    result += (num * multiple)
  };

  return result;
}

console.log(stringToSignedInteger('4321'));      // 4321
console.log(stringToSignedInteger('-570'));      // -570
console.log(stringToSignedInteger('+100'));      // 100
