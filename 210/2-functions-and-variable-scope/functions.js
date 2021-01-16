function average(values) {
  return sum(values)/values.length;
}

function sum(values) {
  let total = 0;
  for (let element of values) {
    total += element;
  };

  return total;
}

let temperatures = [24, 25, 29];
console.log(average(temperatures));

