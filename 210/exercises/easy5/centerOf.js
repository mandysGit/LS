function centerOf(str) {
  if (str.length % 2 !== 0) return str[Math.floor(str.length / 2)];
  return str[(str.length / 2) - 1] + str[(str.length / 2)];
}
console.log(centerOf('I Love JavaScript')); // "a"
console.log(centerOf('Launch School'));     // " "
console.log(centerOf('Launch'));            // "un"
console.log(centerOf('Launchschool'));      // "hs"
console.log(centerOf('x'));                 // "x"
