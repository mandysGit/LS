function makeCounter() {
  let count = 1;

  return () => {
    console.log(count++)
  };
}

const counter = makeCounter();
counter();
// more code

/*  Will the JavaScript garbage collection mechanism garbage collect the value assigned to the variable count after the function counter is run on line 10?

No, JS will not garbabe collect the value assigned to 
variable count on line 2. The closure that is created by invoking `makeCounter` function on line `9` will still have access to the `count` variable.

After `counter` is executed, the `counter` function closed 
over it's outer scope and where the value `count` still is accessible. As long as the `counter` function exists, so will the value that `count` points to because `counter` still has access to that scope where `count` is initialized to `1`. 
