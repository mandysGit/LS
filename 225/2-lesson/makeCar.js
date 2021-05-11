function makeCar(rate, brakeRate) {
  let car = {
    speed: 0,
    rate,
    brakeRate,
    accelerate() {
      this.speed += this.rate;
    },
    brake() {
      this.speed -= this.brakeRate;
      if (this.speed < 0) this.speed = 0;
    }
  }

  return car;
}

let sedan = makeCar(8, 4);
sedan.accelerate();
console.log(sedan.speed);

sedan.brake();
console.log(sedan.speed);

sedan.brake();
console.log(sedan.speed);

// let coupe = makeCar(12);
// coupe.accelerate();
// console.log(coupe.speed);

// let hatchback = makeCar(9);
// hatchback.accelerate();
// console.log(hatchback.speed);



