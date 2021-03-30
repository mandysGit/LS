function sum(n) {
  return String(n).split('')
                  .map(n => Number(n))
                  .reduce((acc, current) => acc + current)
}
console.log(sum(23));           // 5
console.log(sum(496));          // 19
console.log(sum(123456789));    // 45
