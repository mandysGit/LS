function twice(n) {
  if (!isDoubleDouble(n)) return n*2;
  return n;
}

function isDoubleDouble(n) {
  let str = n.toString();
  let length = str.length;
  return length % 2 === 0 && str.slice(0, length/2) === str.slice(length/2);
}
console.log(twice(37));          // 74
console.log(twice(44));          // 44
console.log(twice(334433));      // 668866
console.log(twice(444));         // 888
console.log(twice(107));         // 214
console.log(twice(103103));      // 103103
console.log(twice(3333));        // 3333
console.log(twice(7676));        // 7676
