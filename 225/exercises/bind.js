function bind(func, context, ...partialArgs) {
  return function(...args) {
    const allArgs = partialArgs.concat(args);
    return func.apply(context, args);
  };
}

function addNumbers(a, b) {
  return a + b;
}

const addFive = myBind(addNumbers, null, 5);

addFive(10); // 15
