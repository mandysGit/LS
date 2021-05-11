// let me = {
//   firstName: 'Jane',
//   lastName: 'Doe',
// }

let me = {};

me.firstName = 'Jane';
me.lastName = 'Doe';

let friend = {
  firstName: 'John',
  lastName: 'Smith',
};

let mother = {
  firstName: 'Amber',
  lastName: 'Doe',
};

let father = {
  firstName: 'Shane',
  lastName: 'Doe',
}

// let people = [];

// function fullName(person) {
//   console.log(person.firstName + ' ' + person.lastName);
// }

// fullName(me);
// fullName(friend);
// fullName(mother);
// fullName(father);

// people.push(me, friend, mother, father);

// function rollCall(collection) {
//   collection.forEach(fullName);
// }

// rollCall(people);

let people = {
  collection: [me, friend, mother, father],
  fullName: function(person) {
    console.log(person.firstName + ' ' + person.lastName);
  },
  rollCall: function() {
    this.collection.forEach(this.fullName);
  },
  get: function() {
    if (!this.isValidPerson(person)) return;
    return this.collection[this.getIndex(person)];
  },
  add: function(person) {
    if (!this.isValidPerson(person)) return;
    person.index = this.collection.length;
    this.collection.push(person);
  },
  remove: function(person) {
    if (!this.isValidPerson(person)) return;

    let index = this.getIndex(person);
    if (index === -1) return;

    this.collection.splice(index, 1);
  },
  getIndex: function(person) {
    let index = -1; 
    this.collection.forEach(function(comparator, i) {
      if (comparator.firstName === person.firstName &&
          comparator.lastName === person.lastName) {
        index = i;
      }
    });

    return index;
  },
  isValidPerson: function(person) {
    return typeof person.firstName === 'string' && typeof person.lastName === 'string';
  },
  update: function(person) {
    if (!this.isValidPerson(person)) return;

    let existingPersonId = this.getIndex(person);
    if (existingPersonId === -1) {
      this.add(person);
    } else {
      this.collection[existingPersonId] = person;
    }
  },
}

people.rollCall();
console.log(people.isValidPerson(friend));
people.add(
{
  firstName: 'Mandy',
  lastName: 'cheang',
  occupation: 'developer',
});
people.add(
{
  firstName: 'Mandy',
  lastName: 'cheang',
  occupation: 'developer',
});

console.log(people)
