function indexOf(firstString, secondString) {
  for (let i = 0; i <= firstString.length - secondString.length; i++) {
    if (createSubStringToCompare(i, i + secondString.length, firstString) === secondString) {
      return i;
    }
  }

  return -1;
};

function createSubStringToCompare(start, end, substring) {
  let index = start;
  let result = '';

  while (index < end) {
    result += substring[index];
    index++;
  };

  return result;
}

function lastIndexOf(firstString, secondString) {
  let substringIndexes = [];

  for (let i = 0; i <= firstString.length - secondString.length; i++) {
    if (createSubStringToCompare(i, i + secondString.length, firstString) === secondString) {
      substringIndexes.push(i);
    }
  }

  if (substringIndexes.length > 1) return substringIndexes[substringIndexes.length - 1];
  return -1;
}

console.log(indexOf('Some strings', 's'));                      // 5
console.log(indexOf('Blue Whale', 'Whale'));                    // 5
console.log(indexOf('Blue Whale', 'Blute'));                    // -1
console.log(indexOf('Blue Whale', 'leB'));                      // -1

console.log(lastIndexOf('Some strings', 's'));                  // 11
console.log(lastIndexOf('Blue Whale, Killer Whale', 'Whale'));  // 19
console.log(lastIndexOf('Blue Whale, Killer Whale', 'all'));    // -1
