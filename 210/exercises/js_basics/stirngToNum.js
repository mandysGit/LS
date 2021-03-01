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

console.log(stringToInteger('4321'));      // 4321
console.log(stringToInteger('570'));       // 570
