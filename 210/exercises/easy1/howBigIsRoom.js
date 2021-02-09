let rlSync = require('readline-sync');
const SQMETERS_TO_SQFEET = 10.7639;

let length = rlSync.question('Enter the length of the room in meters:\n');
let width = rlSync.question('Enter the width of the room in meters:\n');

length = parseInt(length, 10);
width = parseInt(width, 10);

let area = length * width;
let areaSqrtFeet = area * SQMETERS_TO_SQFEET;
console.log(`The area of the room is ${area.toFixed(2)} square meters (${areaSqrtFeet.toFixed(2)} square feet).`);
