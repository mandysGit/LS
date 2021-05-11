function makeMultipleLister(num) {
  return function() {
    let multiple = num;

    while (multiple < 100) {
      if (multiple % num === 0) {
        console.log(multiple);
      }
      multiple += 1;
    }
  }
}

function makeMultipleLister(number) {
  return function() {
    for (let i = number; i < 100; i += number) {
      console.log(i)
    }
  }
}

let lister = makeMultipleLister(13);
lister();
