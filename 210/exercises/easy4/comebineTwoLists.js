function interleave(arr1, arr2) {
  let result = [];
  for (let idx = 0; idx < arr1.length; idx += 1) {
    result.push(arr1[idx]);
    result.push(arr2[idx]);
  }

  return result;
}
console.log(interleave([1, 2, 3], ['a', 'b', 'c']));    // [1, "a", 2, "b", 3, "c"]
