function greetings(arr, obj) {
  let fullName = arr.join(' ');
  let title = obj.title;
  let occupation = obj.occupation;
  console.log(`Hello, ${fullName}! Nice to have a ${title} ${occupation} around.`)
}

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' });

// console output
// Hello, John Q Doe! Nice to have a Master Plumber around.
