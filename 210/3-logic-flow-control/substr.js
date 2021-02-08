function substr(string, start, length) {
  let result = '';
  if (start < 0) start = string.length + start;
  if (length > string.length) length = string.length - start;

  while (length > 0) {
    result += string[start];
    start++;
    length--;
  };

  return result;
}

let string = 'hello world';

console.log(substr(string, 2, 4));      // "llo "
console.log(substr(string, -3, 2));     // "rl"
console.log(substr(string, 8, 20));     // "rld"
console.log(substr(string, 0, -20));    // ""
console.log(substr(string, 0, 0));      // ""
