let today = new Date();
console.log(today);

let dayOfWeek = today.getDay();
console.log(`Today's day is ${dayOfWeek}`)

let daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
console.log(`Today's day is ${daysOfWeek[today.getDay()]}`)

let dayOfMonth = today.getDate();
console.log(`Today's date is ${daysOfWeek[today.getDay()]}, the ${dayOfMonth}`)

function dateSuffix(num) {
  if ([1, 21, 31].includes(num)) return 'st';
  if ([2, 22].includes(num)) return 'nd';
  if ([3, 23].includes(num)) return 'rd';
  return 'th';
}

console.log(`Today's date is ${daysOfWeek[today.getDay()]}, the ${dayOfMonth}${dateSuffix(dayOfMonth)}`)

let monthIndex = today.getMonth();
let months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];


console.log(`Today's date is ${daysOfWeek[today.getDay()]}, ${months[monthIndex]} the ${dayOfMonth}${dateSuffix(dayOfMonth)}`)

function formattedMonth(today) {
  return `${months[monthIndex]} the ${dayOfMonth}${dateSuffix(dayOfMonth)}`;
}

function formattedDay(today) {
  return daysOfWeek[today.getDay()];
}

function formattedDate(today) {
  return `Today's date is ${formattedDay(today)}, ${formattedMonth(today)}`
}

console.log(formattedDate(today))
console.log(today.getFullYear())
console.log(today.getYear())
console.log(today.getTime())

let tomorrow = new Date(today.getTime());
tomorrow.setDate(today.getDate() + 1);
console.log(formattedDate(tomorrow));

let nextWeek = new Date(today.getTime());
console.log(today.toDateString() === nextWeek.toDateString());
nextWeek.setDate(today.getDate() + 7);
console.log(today.toDateString() === nextWeek.toDateString());


function formatTime(date) {
  let hour = date.getHours();
  let minutes = date.getMinutes();

  if (hour.length < 2) hour = `0${hour}`;
  if (minutes.length < 2) minute = `0${minutes}`;
  return `${hour}:${minutes}`;
}

console.log(formatTime(today));

