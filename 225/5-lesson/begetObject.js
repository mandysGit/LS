Object.prototype.begetObject = function() {
  return Object.setPrototypeOf({}, this);
}

Object.prototype.begetObject = function() {
  function F() {};
  F.prototype = this;
  return new F();
}
let foo = {
  a: 1,
};

let bar = foo.begetObject();
console.log(foo.isPrototypeOf(bar));         // true
