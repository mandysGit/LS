/*
Problem:
Input
- Given 2 numbers as a String with 0 or more decimals
- Compare the two numbers

Output:
- Return 1 if v1 > v2
- Return -1 v1 < v2
- Return 0 both are equal
- Return null if the characters contain anything other than digits or .

Implicit rules:
- A version is greater than another version
  - when a number in it's position in one version is greater than the number in the same position in the other version
  - positions are split by the .
  - 0.1 < 1 is equivalent to 0.1 < 1.0
  - 0 is in position 0 in V1, 1 is in position 0 in V2, 0 isless than 1, return -1
  - Therefore 0.1 is less than 1.0, return - 1

Examples:
0.1 < 1 = 1.0 < 1.1 < 1.2 = 1.2.0.0 < 1.18.2 < 13.37

1.a is not a valid version          // we only want to deal with numbers and dots
.1 and 1. are not valid versions    // versions must begin and end with a number
1..0 is not a valid version         // dots can only appear between two numbers
1.0 and 1.0.0 are equal to 1        // zeros can be inferred but are not always shown
1.0.0 is less than 1.1              // can handle version numbers with different lengths
1.0 is less than 1.0.5              // can handle version numbers with different lengths

Algo:
isValid helper
Return false: 
  - if input is not a string
  - match any characters that are not digits or .
  - if there are two .. side by side
  - if it does being or end with a digit
  - if empty string
- otherwise return true

compareVersions function
- split the two version strings by . to create two arrays
- map each array by converting each element to a number

- pad the shorter array with trailing zeros until the 
shorter array is the same length as the longer array

- compare each element from modified shorter array and longer array
- if the number from arr1 is greater, return 1
- if the number from arr1 is smaller, return -1

- After iteration, return 0 because all numbers are equal;
*/
function isValid(str) {
  const digits = '1234567890';

  if (typeof str !== 'string') return false;
  if (str.match(/[^\d.]/)) return false;
  if (str.match(/\.\.+/)) return false;
  if (!digits.includes(str[0]) || !digits.includes(str.slice(-1))) return false;
  if (str.length === 0) return false;

  return true;
}

function compareVersions(v1, v2) {
  if (!isValid(v1) || !isValid(v2)) return null;

  let arr1 = v1.split('.').map(n => Number(n));
  let arr2 = v2.split('.').map(n => Number(n));

  if (arr1.length < arr2.length) {
    while (arr1.length !== arr2.length) {
      arr1.push(0);
    }
  }

  if (arr1.length > arr2.length) {
    while (arr1.length !== arr2.length) {
      arr2.push(0);
    }
  }

  for (let i = 0; i < arr1.length; i++) {
    if (arr1[i] < arr2[i]) return -1; 
    if (arr1[i] > arr2[i]) return 1; 
  }

  return 0;
}

// Sample solution
function compareVersions(versionA, versionB) {
  let validChars = /^[0-9]+(\.[0-9]+)*$/;

  if (!validChars.test(versionA) || !validChars.test(versionB)) {
    return null;
  }

  let aParts = versionA.split('.').map(Number);
  let bParts = versionB.split('.').map(Number);
  let maxLength = Math.max(aParts.length, bParts.length);

  for (let i = 0; i < maxLength; i += 1) {
    let aValue = aParts[i] || 0;
    let bValue = bParts[i] || 0;

    if (aValue > bValue) {
      return 1;
    } else if (aValue < bValue) {
      return -1;
    }
  }

  return 0;
}

// Edge cases
// only numbers are dots are allowed
// must beginand end  with a number
// dots must only be between two numbers
console.log(compareVersions('a', 'b'))             // null
console.log(compareVersions('1.a', '1'));          // null
console.log(compareVersions('.1', '1'));           // null
console.log(compareVersions('1.', '2'));           // null
console.log(compareVersions('1..0', '2.0'));       // null

console.log(compareVersions('', ''))               // null
console.log(compareVersions(undefined, undefined)) // null
console.log(compareVersions(null, null))           // null

// versions with same lengths
console.log(compareVersions('1.1', '1.2')) // -1

// versions with different lengths
console.log(compareVersions('0.1', '1')) // -1
console.log(compareVersions('1', '0.1')) // 1
console.log(compareVersions('1.2', '1.2.0.0')) // 0
console.log(compareVersions('1.2', '1.2.0.1')) // -1
console.log(compareVersions('1.18.2', '13.38')) // -1
console.log(compareVersions('1.2.0.1', '1.18.2')) // -1

// zeroes are inferred at the end
console.log(compareVersions('1', '1.0')) // 0
console.log(compareVersions('1.0', '1.0.0'));    // 0
console.log(compareVersions('1.0.0', '1.1'));    // -1
console.log(compareVersions('1.0', '1.0.5'));    // -1
