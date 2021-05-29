function createObject(obj) {
  let newObj = {};
  newObj.__proto__ = obj
  return newObj;
}

function createObject(obj) {
  let newObj = {};
  Object.setPrototypeOf(newObj, obj);
  return newObj;
}

function createObject(obj) {
  function F() {}
  F.prototype = obj;
  return new F();
}

let foo = {
  a: 1
};

let bar = createObject(foo);
console.log(foo.isPrototypeOf(bar));         // true
