function callback1() {
  console.log('callback1');
}

function callback2() {
  console.log('callback2');
}

function callback3() {
  console.log('callback3');
}

function randomizer(...callbacks) {
  if (callbacks.length < 1) return; 

  let max = callbacks.length * 2;
  let secondsPassed = 0;

  const timeLogger = setInterval(() => {
    secondsPassed += 1;
    console.log(secondsPassed);
    if (secondsPassed >= max) clearInterval(timeLogger);
  }, 1000);

  for (let callback of callbacks) {
    let maxSeconds = Math.random() * max * 1000;
    setTimeout(callback, maxSeconds);
  }
}

randomizer(callback1, callback2, callback3);

// Output:
// 1
// 2
// "callback2"
// 3
// "callback3"
// 4
// 5
// "callback1"
// 6
