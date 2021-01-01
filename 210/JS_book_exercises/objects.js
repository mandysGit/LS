let person = {
  name: 'Bob',
  occupation: 'web developer',
  hobbies: 'painting'
};

console.log(person.name)
console.log(person['name'])
 
let myArray = {
  0: 'hi',
  1: 'hello',
  2: 'goodbye',
  length: 3
};

for (let i = 0; i < myArray.length; i += 1) {
  console.log(myArray[i]);
};

let obj = {
  b: 2,
  a: 1,
  c: 3,
};

let upperKeys = Object.keys(obj).map(key => key.toUpperCase());

console.log(upperKeys)


let myProtoObj = {
  foo: 1,
  bar: 2
};

let myObj = Object.create(myProtoObj);

myObj.qux = 3;

let objKeys = Object.keys(myObj);

objKeys.forEach(function(key) {
  console.log(key);
});

// for (let key in myObj) {
//   console.log(key);
// }

let objToCopy = {
  foo: 1,
  bar: 2,
  qux: 3,
};

// function copyObj(obj, keys=null) {
//   let result = {}
//   let objKeys = Object.keys(obj)

//   if (keys) {
//     objKeys.forEach(key => {
//       if (keys.includes(key))
//         result[key] = obj[key];
//     });
//   } else {
//     objKeys.forEach(key => result[key] = obj[key]);
//   }

//   return result;
// };

let copyObj = (sourceObject, keys) => {
  let destinationObject = {};

  if (keys) {
    keys.forEach(key => destinationObject[key] = sourceObject[key]);
    return destinationObject;
  } else {
    return Object.assign(destinationObject, sourceObject);
  }
};

let newObj = copyObj(objToCopy);
console.log(newObj);        // => { foo: 1, bar: 2, qux: 3 }

let newObj2 = copyObj(objToCopy, [ 'foo', 'qux' ]);
console.log(newObj2);       // => { foo: 1, qux: 3 }

let newObj3 = copyObj(objToCopy, [ 'bar' ]);
console.log(newObj3);       // => { bar: 2 }



let obj = {
  foo: { a: "hello", b: "world" },
  bar: ["example", "mem", null, { xyz: 6 }, 88],
  qux: [4, 8, 12]
};

obj['bar'][3]['xyz'] = 10;
