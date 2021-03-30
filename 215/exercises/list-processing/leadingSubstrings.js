function leadingSubstrings(str) {
  let result = [];

  for (let i = 1; i <= str.length; i++) {
    result.push(str.slice(0, i));
  }

  return result;
}

// Further Exploration
function leadingSubstrings(str) {
  return str.split('').map((_, idx) => str.slice(0, idx + 1));
}

console.log(leadingSubstrings('abc'));      // ["a", "ab", "abc"]
console.log(leadingSubstrings('a'));        // ["a"]
console.log(leadingSubstrings('xyzzy'));    // ["x", "xy", "xyz", "xyzz", "xyzzy"]
