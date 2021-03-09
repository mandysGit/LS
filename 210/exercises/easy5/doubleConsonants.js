function doubleConsonants(str) {
  let result = '';

  for (let idx = 0; idx < str.length; idx++) {
    let letter = str[idx].toLowerCase();

    if (!['a', 'e', 'i','o', 'u'].includes(letter) && letter.match(/[a-z]/i)) {
      result = result + str[idx] + str[idx];
    } else {
      result += str[idx];
    }
  }

  return result;
}
console.log(doubleConsonants('String'));          // "SSttrrinngg"
console.log(doubleConsonants('Hello-World!'));    // "HHellllo-WWorrlldd!"
console.log(doubleConsonants('July 4th'));        // "JJullyy 4tthh"
console.log(doubleConsonants(''));                // ""
