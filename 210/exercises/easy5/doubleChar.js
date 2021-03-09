function repeater(str) {
  let result = '';
  for (let idx = 0; idx < str.length; idx += 1) {
    result = result + str[idx] + str[idx];
  }

  return result;
}
console.log(repeater('Hello'));        // "HHeelllloo"
console.log(repeater('Good job!'));    // "GGoooodd  jjoobb!!"
console.log(repeater(''));             // ""

