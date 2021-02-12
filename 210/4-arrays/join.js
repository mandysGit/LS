function join(arr, str) {
  let result = '';
  for (let i = 0; i < arr.length - 1; i++) {
    result = result + arr[i] + str;
  };

  result += arr[arr.length - 1];
  return result;
}
console.log(join(['bri', 'tru', 'wha'], 'ck '));       // 'brick truck wha'
console.log(join([1, 2, 3], ' and '));                 // '1 and 2 and 3'
