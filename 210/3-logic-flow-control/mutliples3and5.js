function multiplesOfThreeAndFive() {
  for (let i = 1; i <= 100; i += 1) {
    if (i % 3 === 0 && i % 5 === 0) {
      console.log(String(i) + '!'); 
    } else if (i % 3 === 0 || i % 5 === 0) {
      console.log(String(i))
    } else {
      continue;
    }
  }
}

// Further Exploration
function multiplesOfThreeAndFive(start, end) {
  for (let i = start; i <= end; i += 1) {
    if (i % 3 === 0 && i % 5 === 0) {
      console.log(String(i) + '!'); 
    } else if (i % 3 === 0 || i % 5 === 0) {
      console.log(String(i))
    } else {
      continue;
    }
  }
}
multiplesOfThreeAndFive();
