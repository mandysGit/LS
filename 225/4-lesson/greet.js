function greet(greeting, name) {
  return `${greeting}, ${name}!`;
}

function partial(primary, arg1) {
  return function(arg2) {
    return primary(arg1, arg2);
  };
}

let sayHello = partial(greet, 'Hello');
console.log(sayHello('Mandy'));

let sayHi = partial(greet, 'Hi');
console.log(sayHi('Mandy'));

