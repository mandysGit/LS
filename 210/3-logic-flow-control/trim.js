/* Aglo
- Loop over the str start at index 0
  - Grab the index when we encounter the first non-space, save it in `start`
- Loop over the str, start at last index
  - Grab the index when we encounter the first non-space, save it in `end`
- Loop from start, to end, and concatenate the characters into `result`
- Return `result`
*/

function trim(str) {
  let start = 0;
  let end = 0;
  let result = '';

  for (let i = 0; i < str.length; i++) {
    if (str[i] !== ' ') {
      start = i;
      break;
    }
  }

  for (let i = str.length - 1; i >= 0; i--) {
    if (str[i] !== ' ') {
      end = i;
      break;
    }
  }

  for (let i = start; i <= end; i++) result += str[i];

  return result;
}

console.log(trim('  abc  '));  // "abc"
console.log(trim('abc   '));   // "abc"
console.log(trim(' ab c'));    // "ab c"
console.log(trim(' a b  c'));  // "a b  c"
console.log(trim('      '));   // ""
console.log(trim(''));         // ""
