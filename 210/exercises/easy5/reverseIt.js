function reverseSentence(str) {
  let result = [];

  str.split(' ').forEach(word => result.unshift(word));

  return result.join(' ');
}
console.log(reverseSentence(''));                       // ""
console.log(reverseSentence('Hello World'));            // "World Hello"
console.log(reverseSentence('Reverse these words'));    // "words these Reverse"
