/*
Problem
- Given a string consisting of alpha and non-alpha chars
- Rotate each char of the input string by 13 postions later
- Return to the beginning if you reach the end of the alphabet 
- Dont modify non-letters

Algo
- perform a String transformation
  - Find all occurences of letters a-z, A-Z
  - On each occurence of the letter, call rotate helper function
- return the newString

helper function rotate
- Store the alphabet in an String `ALPHA`
- convert the letter to lowercase
    - find the index of the letter in the `ALPHA` String
    - Add 13 to the index
    - If the index becomes greater than 25, minus 26 from the index
    - minus 26 will allow it to go back to the beginning
- If letter is capital return ALPHA[index] capitalized
- If letter is lowercase return ALPHA[index]
*/

const ALPHABET = 'abcdefghijklmnopqrstuvwxyz';
const OFFSET = ALPHABET.length;
const ROTATION = 13;
const LAST_POSITION_OF_ALPHABET = OFFSET - 1;

function rot13(str) {
  return str.replace(/[a-z]/gi, rotate)
}

function rotate(letter) {
  let index = ALPHABET.indexOf(letter.toLowerCase()) + ROTATION;
  if (index > LAST_POSITION_OF_ALPHABET) index = index - OFFSET;

  if (letter.match(/[A-Z]/)) return ALPHABET[index].toUpperCase();
  return ALPHABET[index];
}

// Edge cases
console.log(rot13('')); // ''

// Symbols & Numbers
console.log(rot13('^&*^*&')); // ^&*^*&
console.log(rot13('123'));    // 123
console.log(rot13('1#1$'));   // 1#1$

// Beginning and end letters
console.log(rot13('A')); // N
console.log(rot13('a')); // n
console.log(rot13('z')); // m
console.log(rot13('Z')); // M

// Sample tests
console.log(rot13('Teachers open the door, but you must enter by yourself.'));
// logs:
// Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.

console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')))
// logs:
// Teachers open the door, but you must enter by yourself.;
