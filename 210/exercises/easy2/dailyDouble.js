function crunch(str) {
  let result = '';
  for (let i = 0; i < str.length; i++) {
    if (result[result.length - 1] !== str[i]) {
      result += str[i];
    }
  };

  return result;
}

console.log(crunch('ddaaiillyy ddoouubbllee'));    // "daily double"
console.log(crunch('4444abcabccba'));              // "4abcabcba"
console.log(crunch('ggggggggggggggg'));            // "g"
console.log(crunch('a'));                          // "a"
console.log(crunch(''));                           // ""
