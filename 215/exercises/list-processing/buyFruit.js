function buyFruit(arr) {
  let result = [];

  arr.forEach(basket => {
    let count = basket[1];
    while (count > 0) {
      result.push(basket[0]);
      count--;
    }
  })

  return result;
}

function repeat(fruit, count) {
  let result = [];

  while (count > 0) {
    result.push(fruit);
    count--;
  }

  return result;
}

function buyFruit(arr) {
  return arr.map(basket => repeat(basket[0], basket[1]))
            .flat();
}

console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]
