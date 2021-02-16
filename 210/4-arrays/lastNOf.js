function lastNOf(arr, count) {
  let arrIdx = arr.length - 1;
  let resultIdx = count - 1;
  let result = [];

  while (resultIdx >= 0) {
    result[resultIdx] = arr[arrIdx];
    arrIdx--;
    resultIdx--;
  };

  return result;
}

function lastNOf(arr, count) {
  let index = arr.length - count;
  if (index < 0) index = 0;

  return arr.slice(index);
}

let digits = [4, 8, 15, 16, 23, 42];
console.log(lastNOf(digits, 3));    // returns [16, 23, 42]
