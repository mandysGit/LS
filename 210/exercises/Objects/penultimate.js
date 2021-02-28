function penultimate(string) {
  let arr = string.split(' ')
  return arr[arr.length - 2];
}

console.log(penultimate('last word'));                    // expected: "last"
console.log(penultimate('Launch School is great!'));      // expected: "is"
