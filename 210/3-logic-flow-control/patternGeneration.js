let generatePattern = (nStars) => {
  let num = 1;
  let stars = nStars - num;

  while (num <= nStars) {
    console.log(createNums(num) + createStars(stars));
    num++;
    stars--;
  }
}

let createNums = (amount) => {
  let result = '';
  let count = 1;

  while (count <= amount) {
    result += String(count);
    count ++;
  };

  return result;
};

// let createStars = (amount) => {
//   return '*'.repeat(amount);
// };

// Further Exploration
let createStars = (amount) => {
  let result = ''
  let count = 1;

  while (count <= amount) {
    if (count <= 11) {
      result += '**';
    } else {
      result += '*';
    }
    count++;
  }

  return result;
};

generatePattern(20);
// generatePattern(8);
// generatePattern(2);

// console output
// 1******
// 12*****
// 123****
// 1234***
// 12345**
// 123456*
// 1234567
