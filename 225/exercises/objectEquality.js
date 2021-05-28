function objectsEqual(obj1, obj2) {
  let keys1 = Object.getOwnPropertyNames(obj1).sort();
  let keys2 = Object.getOwnPropertyNames(obj2).sort();

  if (keys1.length !== keys2.length) return false; 

  for (i = 0; i < keys1.length ; i++) {
    if (keys1[i] !== keys2[i] || obj1[keys1[i]] !== obj2[keys2[i]]) {
      return false;
    }
  }

  return true;
}

console.log(objectsEqual({a: 'foo'}, {a: 'foo'}));                      // true
console.log(objectsEqual({a: 'foo', b: 'bar'}, {a: 'foo'}));            // false
console.log(objectsEqual({}, {}));                                      // true
console.log(objectsEqual({a: 'foo', b: undefined}, {a: 'foo', c: 1}));  // false
