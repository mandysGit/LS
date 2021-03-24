function myReduce(array, func, initial) {
  let accumulator = initial ? initial : array[0];

  if (initial) {
    array.forEach((current, index, array) => { 
      accumulator = func(accumulator, current, index, array);
    });

    return accumulator;
  };

  for (let i = 1; i < array.length; i++) {
    accumulator = func(accumulator, array[i], i, array);
  }

  return accumulator;
}

function myReduce(array, func, initial) {
  let accumulator;
  let index;

  if (initial === undefined) {
    accumulator = array[0];
    index = 1;
  } else {
    accumulator = initial;
    index = 0;
  }

  array.slice(index).forEach(current => accumulator = func(accumulator, current));
  return accumulator;
}

let smallest = (result, value) => (result <= value ? result : value);
let sum = (result, value) => result + value;

console.log(myReduce([5, 12, 15, 1, 6], smallest));           // 1
console.log(myReduce([5, 12, 15, 1, 6], sum, 10));            // 49
