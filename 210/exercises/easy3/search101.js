let rlSync = require('readline-sync');

function isIncluded(arr, val) {
  return arr.some(element => element > val);
}

let num1 = rlSync.question("Enter the 1st number: ");
let num2 = rlSync.question("Enter the 2nd number: ");
let num3 = rlSync.question("Enter the 3rd number: ");
let num4 = rlSync.question("Enter the 4th number: ");
let num5 = rlSync.question("Enter the 5th number: ");
let lastNum = rlSync.question("Enter the last number: ");

let nums = [num1, num2, num3, num4, num5];
if (isIncluded(nums,lastNum)) console.log(`The number ${lastNum} appears greater a number in [${nums}]`);
if (!isIncluded(nums,lastNum)) console.log(`The number ${lastNum} does not appear greater than any numbers in [${nums}]`);

