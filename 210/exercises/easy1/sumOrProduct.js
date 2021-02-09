let rlSync = require('readline-sync');
// let integer = Number(rlSync.question('Please enter an integer greater than 0: '));
// let operation = rlSync.question('Enter "s" to compute the sum, or "p" to compute the product. ');
// let result = 1;

// if (operation === 's') {
//   for (let i = 2; i <= integer; i++) {
//     result += i;
//   };
//   console.log(`The sum of the intergers between 1 and ${integer} is ${result}.`);
// }

// if (operation === 'p') {
//   for (let i = 2; i <= integer; i++) {
//     result *= i;
//   };
//   console.log(`The product of the intergers between 1 and ${integer} is ${result}.`);
// }

// Further Exploration
function computeSum(str) {
  return str.split(',')
            .map(n => parseInt(n, 10))
            .reduce((num, acc) => num + acc, 0);
}

function computeProduct(str) {
  return str.split(',')
            .map(n => parseInt(n, 10))
            .reduce((num, acc) => num * acc, 1);
  }

const number = rlSync.question('Please enter integers greater than 0: ');
const operation = rlSync.question('Enter "s" to compute the sum, or "p" to compute the product.');

if (operation === 's') {
  let sum = String(computeSum(number));
  console.log(`The sum of the integers is ${sum}.`);
} else if (operation === 'p') {
  let product = String(computeProduct(number));
  console.log(`The product of the integers is ${product}.`);
} else {
  console.log('Oops. Unknown operation.');
}

