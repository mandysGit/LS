Object.prototype.ancestors = function() {
  let names = [];
  let parent = Object.getPrototypeOf(this);

  while (parent !== Object.prototype) {
    names.push(parent.name);
    parent = Object.getPrototypeOf(parent);
  } 

  names.push('Object.prototype')

  return names;
}

const foo = {name: 'foo'};
const bar = Object.create(foo);
bar.name = 'bar';
const baz = Object.create(bar);
baz.name = 'baz';
const qux = Object.create(baz);
qux.name = 'qux';

console.log(qux.ancestors());  // returns ['baz', 'bar', 'foo', 'Object.prototype']
console.log(baz.ancestors());  // returns ['bar', 'foo', 'Object.prototype']
console.log(bar.ancestors());  // returns ['foo', 'Object.prototype']
console.log(foo.ancestors());  // returns ['Object.prototype']
