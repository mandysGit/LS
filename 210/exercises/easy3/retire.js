let rlSync = require('readline-sync');
let age = rlSync.question("What's your age? ");
let retireAge = rlSync.question("At what age would you like to reitre? ");
let currentYear = new Date().getFullYear();
let retireYear = 2021 + (retireAge - age);
let yearsLeft = retireYear - currentYear;

console.log(`It's ${currentYear}. You will retire in ${retireYear}`);
console.log(`You only have ${yearsLeft} years of work to go!`);


