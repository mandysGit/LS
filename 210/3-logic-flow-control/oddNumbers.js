function logOddNumbers(num) {
  let counter = 0;

  while (counter <= num) {
    if (counter % 2 === 1) {
      console.log(counter);
    }
    counter++;
  }
}

function logOddNumbers(num) {
  for (let currentNumber = 1; currentNumber <= number; currentNumber += 1) {
    if (currentNumber % 2 === 1) {
      console.log(currentNumber);
    }
  };
}

function logOddNumbers(num) {
  let counter = 1;

  while (counter <= num) {
    console.log(counter);
    counter += 2;
  }
}

function logOddNumbers(num) {
  let counter = 0;

  while (counter <= num) {
    counter += 1;
    if (counter % 2 === 0) {
      continue;
    }
    console.log(counter);
  }
}

logOddNumbers(19);
