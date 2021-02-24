function repeatedCharacters(str) {
  let temp = {}
  let result = {}
  for (let i = 0; i < str.length; i++) {
    let letter = str[i].toLowerCase();
    if (letter in temp) {
      temp[letter] += 1
    } else {
      temp[letter] = 1;
    }
  }

  for (let letter in temp) {
    if (temp[letter] > 1) result[letter] = temp[letter];
  };

  return result;
}
console.log(repeatedCharacters('Programming'));    // { r: 2, g: 2, m: 2 }
console.log(repeatedCharacters('Combination'));    // { o: 2, i: 2, n: 2 }
console.log(repeatedCharacters('Pet'));            // {}
console.log(repeatedCharacters('Paper'));          // { p: 2 }
console.log(repeatedCharacters('Baseless'));       // { s: 3, e: 2 }
