function repeat(string, times) {
  if (typeof times !== 'number' || times < 0) return undefined;
  if (times === 0) return '';

  let result = '';
  for (let i = 0; i < times; i++) {
    result += string;
  };

  return result;
}
console.log(repeat('abc', 1));       // "abc"
console.log(repeat('abc', 2));       // "abcabc"
console.log(repeat('abc', -1));      // undefined
console.log(repeat('abc', 0));       // ""
console.log(repeat('abc', 'a'));     // undefined
console.log(repeat('abc', false));   // undefined
console.log(repeat('abc', null));    // undefined
console.log(repeat('abc', '  '));    // undefined
