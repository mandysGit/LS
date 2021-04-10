function isBalanced(str) {
  let count = 0;

  for (let i = 0; i < str.length; i++) {
    if (count < 0) {
      return false;
    }

    if (str[i] === '(') count += 1;
    if (str[i] === ')') count -= 1;
  }

  return count === 0;
}
console.log(isBalanced('What (is) this?'));        // true
console.log(isBalanced('What is) this?'));         // false
console.log(isBalanced('What (is this?'));         // false
console.log(isBalanced('((What) (is this))?'));    // true
console.log(isBalanced('((What)) (is this))?'));   // false
console.log(isBalanced('Hey!'));                   // true
console.log(isBalanced(')Hey!('));                 // false
console.log(isBalanced('What ((is))) up('));       // false
