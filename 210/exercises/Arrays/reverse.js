function reverse(input) {
  if (Array.isArray(input)) {
    return reverseHelper(input);
  }

  return reverseHelper(input).join('');
}

function reverseHelper(input) {
  let result = [];
  for (let i = 0; i < input.length; i++) {
    result.unshift(input[i]);
  }

  return result;
}
console.log(reverse('Hello'));           // "olleH"
console.log(reverse('a'));               // "a"
console.log(reverse([1, 2, 3, 4]));      // [4, 3, 2, 1]
console.log(reverse([]));                // []
const array = [1, 2, 3];
console.log(reverse(array));             // [3, 2, 1]
console.log(array);                      // [1, 2, 3]
