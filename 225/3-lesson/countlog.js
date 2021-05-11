function makeCounterLogger(firstNum) {
  return function(secondNum) {
    let temp = firstNum;

    console.log(temp);
    while (temp > secondNum) {
      temp--;
      console.log(temp);
    }

    while (temp < secondNum) {
      temp++;
      console.log(temp);
    }
  }
}

function makeCounterLogger(start) {
  return function(finish) {
    let i;

    if (start > finish) {
      for (i = start; i >= finish; i -= 1) {
        console.log(i);
      }
    } else {
      for (i = start; i <= finish; i += 1) {
        console.log(i);
      }
    }
  };
}
let countlog = makeCounterLogger(5);
countlog(8);
countlog(2);
