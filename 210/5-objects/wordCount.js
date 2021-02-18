function wordCount(str) {
  let result = {};
  str.split(' ').forEach(name => {
    if (result[name]) {
      result[name] += 1;
    } else {
      result[name] = 1;
    }
  });

  return result;
}
console.log(wordCount('box car cat bag box'));  // { box: 2, car: 1, cat: 1, bag: 1 }
