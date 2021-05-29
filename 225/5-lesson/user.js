function User(first, last) {
  let name = first + ' ' + last;

  if (this instanceof User) {
    this.name = name;
    return this;
  } else {
    return {
      name,
    }
  }
}

function User(first, last) {
  if (!(this instanceof User)) {
    return new User(first, last);
  }

  this.name = first  + ' ' + last;
}

let name = 'Jane Doe';
let user1 = new User('John', 'Doe');
let user2 = User('John', 'Doe');

console.log(name);         // => Jane Doe
console.log(user1.name);   // => John Doe
console.log(user2.name);   // => John Doe
