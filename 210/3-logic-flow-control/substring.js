function substring(string, start, end) {
  if (start > end) [start, end] = [end, start];
  if (end === undefined) end = string.length;
  if (start < 0 || Number.isNaN(start) || typeof start !== 'number') start = 0;
  if (end < 0 || Number.isNaN(end) || typeof end !== 'number') end = 0;
  if (start > string.length) start = string.length;
  if (end > string.length) end = string.length;

  let result = '';
  for (let i = start; i < end; i ++) {
    result += string[i];
  };

  return result;
}

let string = 'hello world';

console.log(substring(string, 2, 4));    // "ll"
console.log(substring(string, 4, 2));    // "ll"
console.log(substring(string, 0, -1));   // ""
console.log(substring(string, 2));       // "llo world"
console.log(substring(string, 'a'));     // "hello world"
console.log(substring(string, 8, 20));   // "rld"
console.log(string.substring(2, 4));    // "ll"
console.log(string.substring(4, 2));    // "ll"
console.log(string.substring(0, -1));   // ""
console.log(string.substring(-1, 0));   // ""
console.log(string.substring(8, 20));   // "rld"
console.log(string.substring(20, 8));   // "rld"
console.log(string.substring(2));       // "llo world"
