/* 
1. No delimiter print out error ✅
2. Happy path ✅
3. empty string, print out every char ✅
4. Delimiter is not in the string ✅
5. Delimiter as the first character, print out empty line ✅

Algo
---
- Initialize an emtpy array, result = []
- if first char of string is the delimiter, push '' into result
- initialize a local variable `word` to empty string

- Loop through each char of the string
  - word += char if char is not the delimiter
  - if char is the delimiter
    - push `word` to `result` array, and skip to next char
    - reassign `word` to ''
- push word to result, if not empty string
*/

function splitString(string, delimiter) {
  if (delimiter === undefined) {
    console.log("ERROR: No delimiter");
    return;
  }

  let word = '';
  for (let i = 0; i < string.length; i++) {
    if (delimiter === '') {
      console.log(string[i]);
    } else if (string[i] !== delimiter) {
      word += string[i];
    } else if (string[i] === delimiter) {
      console.log(word);
      word = '';
    }
  };

  if (word !== '') console.log(word);
}

splitString('abc,123,hello world', ',');
// logs:
// abc
// 123
// hello world

console.log('-')
splitString('hello');
// logs:
// ERROR: No delimiter

console.log('-')
splitString('hello', '');
// logs:
// h
// e
// l
// l
// o

console.log('-')
splitString('hello', ';');
// logs:
// hello

console.log('-')
splitString(';hello;', ';');
// logs:
//  (this is a blank line)
// hello

