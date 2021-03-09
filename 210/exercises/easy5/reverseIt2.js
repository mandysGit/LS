function reverseWords(str) {
  return str.split(' ')
            .map(word => {
              if (word.length >= 5) return reverse(word);
              return word
            }).join(' ');
  }

function reverse(word) {
  return word.split('').reverse().join('');
}
console.log(reverseWords('Professional'));             // "lanoisseforP"
console.log(reverseWords('Walk around the block'));    // "Walk dnuora the kcolb"
console.log(reverseWords('Launch School'));            // "hcnuaL loohcS"
