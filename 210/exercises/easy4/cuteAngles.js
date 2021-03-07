function dms(angle) {
  while (angle < 0) {
    angle = 360 + angle;
  }

  const MINS_IN_DEGREES = 60;
  const SECS_IN_MINUTES = 60;
  let degrees = Math.floor(angle);
  let fractionalMins = (angle % 1) * MINS_IN_DEGREES;
  let mins = Math.floor(fractionalMins);
  let secs = Math.floor((fractionalMins % 1) * SECS_IN_MINUTES);
  return `${degrees}˚${padZeroes(mins)}'${padZeroes(secs)}"`;
}

function padZeroes(num) {
  if (String(num).length === 1) {
    return `0${num}`;
  }
  return `${num}`;
}
console.log(dms(30));           // 30°00'00"
console.log(dms(76.73));        // 76°43'48"
console.log(dms(254.6));        // 254°35'59"
console.log(dms(93.034773));    // 93°02'05"
console.log(dms(0));            // 0°00'00"
console.log(dms(360));          // 360°00'00" or 0°00'00"
console.log(dms(-1));   // 359°00'00"
console.log(dms(400));  // 40°00'00"
console.log(dms(-40));  // 320°00'00"
console.log(dms(-420)); // 300°00'00"
