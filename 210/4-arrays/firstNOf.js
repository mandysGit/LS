function firstNOf(arr, count) {
  let result = [];
  for (let i = 0; i < count; i++) {
    result[i] = arr[i];
  };

  return result;
}

let digits = [4, 8, 15, 16, 23, 42];
console.log(firstNOf(digits, 3));    // returns [4, 8, 15]
