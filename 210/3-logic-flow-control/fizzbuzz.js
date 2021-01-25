// function fizzbuzz() {
//   num = 1;

//   while (num <= 100) {
//     if (num % 3 === 0 && num % 5 === 0) {
//       console.log("FizzBuzz");
//     } else if (num % 3 === 0) {
//       console.log("Fizz");
//     } else if (num % 5 === 0) {
//       console.log("Buzz");
//     } else {
//       console.log(num);
//     }

//     num++;
//   };
//}

// let fizzbuzz = () => {
//   for (let index = 1; index <= 100; index += 1) {
//     let message = index;

//     if (index % 3 === 0 && index % 5 === 0) {
//       message = 'FizzBuzz';
//     } else if (index % 3 === 0) {
//       message = 'Fizz';
//     } else if (index % 5 === 0) {
//       message = 'Buzz';
//     }

//     console.log(message);
//   }
// };

function fizzbuzz() {
  let num = 1;

  while (num <= 100) {
    let message = '';
    if (num % 3 === 0) message += 'Fizz';
    if (num % 5 === 0) message += 'Buzz';

    console.log(message || num);
    num++;
  };
}

fizzbuzz();
