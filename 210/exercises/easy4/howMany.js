function countOccurrences(arr) {
  let result = {};

  for (let element of arr) {
    if (element in result) {
      result[element] += 1;
    } else {
      result[element] = 1;
    }
  }

  Object.keys(result).forEach(key => console.log(`${key} => ${result[key]}`));
}
const vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
                'motorcycle', 'motorcycle', 'car', 'truck'];

console.log(countOccurrences(vehicles));

// console output
// car => 4
// truck => 3
// SUV => 1
// motorcycle => 2
