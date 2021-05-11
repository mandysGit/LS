// let total = 0;

// function operation(op) {
//   return function(num) {
//     if (op === 'add') {
//       total += num;
//       console.log(total);
//     }

//     if (op === 'subtract') {
//       total -= num;
//       console.log(total);
//     }
//   }
// }

// let add = operation('add');
// let subtract = operation('subtract');

let total = 0;

function add(number) {
  total += number;
  console.log(total);
}

function subtract(number) {
  total -= number;
  console.log(total);
}

add(1);
add(42);
subtract(39);
add(6);
