function leadingSubstrings(str) {
  return str.split('').map((_, idx) => str.slice(0, idx + 1));
}

function substrings(str) {
  let result = [];
  
  for (let i = 0; i < str.length; i++) {
    result = result.concat(leadingSubstrings(str.slice(i)));
  }

  return result;
}

// Further Exploration
function substrings(str) {
  return str.split('')
            .map((_, idx) => leadingSubstrings(str.slice(idx)))
            .flat();
}

console.log(substrings('abcde'));

// returns
// [ "a", "ab", "abc", "abcd", "abcde",
//   "b", "bc", "bcd", "bcde",
//   "c", "cd", "cde",
//   "d", "de",
//   "e" ]
