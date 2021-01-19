// let logMultiples = (num) => {
//   for (let i = 100; i > 0; i -= 1) {
//     if (i % 2 === 1 && i % num === 0) {
//       console.log(i);
//     }
//   }
// }

let logMultiples = (num) => {
  largestMulitple = Math.floor(100 / num) * num;

  for (let i = largestMulitple; i > 0; i -= num) {
    if (i % 2 === 1) {
      console.log(i);
    }
  }
}

logMultiples(17);
logMultiples(21);
