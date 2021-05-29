/*
===
  1
===

On line 13, `foo = new Foo()` logs `2`. 
The constructor function `Foo` was invoked with the new operator and
returns a new object with its __proto__ property set to Foo.prototype.
Within the `Foo` constructor function, `this` references the new object created by JS runtime. 

On line 10, `this.bar()` is invoked.
`this` refers to the new object that is created when `Foo` was invoked with new,
and before line 10, the new object's `a` property is assigned `2` (line 6) and `bar` property is
assigned to an anonymous function that logs `this.a` (line 7). 

`this.a` references 2, therefore, invoking `this.bar()` on line 10, logs 2.


On line 15, foo.bar() logs 2. Because on line 6, the foo object's a property has a value of 2.

On line 16, `Foo()` logs 2. But `this` refers to the window object.

Line 19, logs 2 //obj
Line 20, logs 2 //obj.bar()

Line 22, logs 2 // Window object


===
  2
===

`rect` is initialized to the new object returned by calling `Rectangle(2,3)` contructor function
with the new operator. The new object returned has its __proto__ property set to the constructor
function's prototype property value. In other words, the new object's prototype object is
the constructor function's prototype property.

console.log(rect1.area); // NaN because undefined * undefined. `this` is referencing
                         // the `RECTANGLE` object due to method invocation. The context 
                         // of RECTANGLE.area() implicitly resolves to the parent object
                         // of `area` method is defined. Since RECTANGLE object does not have 
                         // width or height properties, that why `this.width` and 
                         // `this.height` returns `undefined`.

console.log(rect1.perimeter) // NaN again

Fix: 

let RECTANGLE = {
  area() {
    return this.width * this.height;
  },
  perimeter() {
    return 2 * (this.width + this.height);
  },
};

function Rectangle(width, height) {
  this.width = width;
  this.height = height;
  this.area = RECTANGLE.area.call(this);
  this.perimeter = RECTANGLE.perimeter(this);
}

let rect1 = new Rectangle(2, 3);
console.log(rect1.area);
console.log(rect1.perimeter);


===
  3
===

function Circle(radius) {
  this.radius = radius;
}

Circle.prototype.area = function() {
  return Math.PI * this.radius * this.radius;
}

let a = new Circle(3);
let b = new Circle(4);

console.log(a.area().toFixed(2)); // => 28.27
console.log(b.area().toFixed(2)); // => 50.27

===
  4
===

`console.log(ninja.swingSword()) will log true;

`ninja = new Ninja();` the `ninja` variable references a new object that is
created by invoking `Ninja` constructor function with the new operator. 

The new object returned by invoking the `Ninja` constructor function has a __proto__ 
property that references `Ninja` constructor function's `prototype` property.
The newly created object inherited all properties from the constructor function's
`prototype` property.  

Therefore, when we invoke `ninja.swingSword()` the ninja object does not have a 
`swingSword` method, then goes up the prototype chain, and finds `swingSword` method
defined in the `Ninja` prototype property, and invokes `swingSword`.

Within the `swingSword` function body, returns `this.swung` on line 9.
`this` within the swingSword method references to the `ninja` object because 
`ninja.swingSword()` is invoked and the context implicitly resolves to `ninja`, which is the calling
object of the `swingSword` method.

The `ninja` object has its own property `swung` and its value is `true`. Therefore the code
logs true.

===
  6
===

let ninjaA;
let ninjaB;
function Ninja() {
  this.swung = false;
}

ninjaA = new Ninja();
ninjaB = new Ninja();

Ninja.prototype.swing = function() {
  this.swung = true;
  return this;
}

console.log(ninjaA.swing().swung);      // must log true
console.log(ninjaB.swing().swung);      // must log true

===
  7
===

let ninjaA = (function() {
  function Ninja(){};
  return new Ninja();
})();

let ninjaB = Object.create(ninjaA.constructor.prototype)

console.log(ninjaB.constructor === ninjaA.constructor);    // should log true


