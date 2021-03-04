function howOldIsTeddy() {
  console.log(`Teddy is ${getAge(20, 200)} years old!`);
}

function getAge(min, max) {
  return Math.floor(Math.random() * (max - min) + min);
}

howOldIsTeddy();
