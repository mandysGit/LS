console.log(Object.prototype === {}.__proto__)
console.log(Object.__proto__ === Function.prototype)
console.log(Object.constructor === Function)

console.log(Function.prototype === function(){}.__proto__)
console.log(Function.constructor === Function)
console.log(Function.__proto__ === Function.prototype)
console.log(Function.prototype.__proto__ === Object.prototype)

console.log(Function.prototype.__proto__ === Object.prototype)
console.log(Object.prototype.__proto__ === null)

let arr = [1, 2, 3];
console.log(arr.__proto__ === Array.prototype);
console.log(arr.constructor === Array);
console.log(Array.prototype.__proto__ === Object.prototype);

console.log(typeof Array === 'function');
console.log(typeof Function === 'function');
console.log(typeof Object === 'function');
console.log(Array.__proto__ === Function.prototype);
console.log(Array.constructore === Function);

console.log(typeof Array.prototype === 'object');
console.log(typeof Object.prototype === 'object');
console.log(typeof Function.prototype === 'function');

console.log(Array.prototype.constructor === Array);
console.log(Object.prototype.constructor === Object);
console.log(Function.prototype.constructor === Function);
