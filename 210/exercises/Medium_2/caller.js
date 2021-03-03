function makeDoubler(caller) {
  let name = caller;
  return function(n) {
    console.log(name);
    return n + n;
  };
}
const doubler = makeDoubler('Mandy');
console.log(doubler(5));                             // returns 10
// logs:
// This function was called by Victor.
