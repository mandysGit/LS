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

function palindromes(str) {
  return substrings(str).filter(string => isPalindrome(string));
}

function isPalindrome(str) {
  if (str.length === 1) return false;
  return str.split('').reverse().join('') === str;
}

console.log(palindromes('abcd'));       // []
console.log(palindromes('madam'));      // [ "madam", "ada" ]
console.log(palindromes('hello-madam-did-madam-goodbye'));
// returns
[ "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
  "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
  "-madam-", "madam", "ada", "oo" ]

console.log(palindromes('knitting cassettes'));
// returns
[ "nittin", "itti", "tt", "ss", "settes", "ette", "tt" ]
