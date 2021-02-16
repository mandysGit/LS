function missing(arr) {
  let missingNums = [];

  for (let i = 0; i < arr.length - 1; i++) {
    let current = arr[i];
    let next = arr[i + 1];
    let temp = current;

    if ((current - next) === 1 || (current - next) === -1) continue;

    do { 
      temp++;
      missingNums.push(temp);
    } while ((temp - next) !==  1 && (temp - next) !== -1);
  };

  return missingNums;
}

function missing(arr) {
  let result = [];

  for (let i = arr[0]; i < arr[arr.length - 1]; i++) {
    if (!arr.includes(i)) result.push(i);
  };

  return result;
}
console.log(missing([-3, -2, 1, 5]));                  // [-1, 0, 2, 3, 4]
console.log(missing([1, 2, 3, 4]));                    // []
console.log(missing([1, 5]));                          // [2, 3, 4]
console.log(missing([6]));                             // []
