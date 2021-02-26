function slice(array, begin, end) {
  let result = [];
  for (let i = begin; i < end && i < array.length; i++) {
    result.push(array[i]);
  };
  return result;
}

console.log(slice([1, 2, 3], 1, 2));               // [2]
console.log(slice([1, 2, 3], 2, 0));               // []
console.log(slice([1, 2, 3], 5, 1));               // []
console.log(slice([1, 2, 3], 0, 5));               // [1, 2, 3]
const arr1 = [1, 2, 3];
console.log(slice(arr1, 1, 3));                     // [2, 3]
console.log(arr1);                                  // [1, 2, 3]

function splice(array, start, deleteCount, element1, elementN) {
  if (start > array.length) start = array.length;
  if (deleteCount > (array.length - start)) deleteCount = array.length - start;
  let deletedElements = [];
  let elementsToAdd = [element1, elementN];
  let countDelete = deleteCount;
  let countAdd = deleteCount;
 
  // Delete elements or replace elements
  for (let i = start; countDelete > 0; i++) {
    deletedElements.push(array[i]);

    if (typeof element1 !== 'undefined') {
      array[i] = element1;
      element1 = undefined;
    } else if (typeof elementN !== 'undefined') {
      array[i] = elementN;
      elementN = undefined;
    } else {
      array[i] = null;
    }

    countDelete--;
  };

  let keepElements = array.filter(ele => ele !== null);
  array.length = keepElements.length;

  for (let i = 0; i < keepElements.length; i++) {
    array[i] = keepElements[i];
  };

  //console.log('array: ', array);
  return deletedElements;
}

console.log('-----------');
console.log(splice([1, 2, 3], 1, 2));              // [2, 3]
console.log(splice([1, 2, 3], 1, 3));              // [2, 3]
console.log(splice([1, 2, 3], 1, 0));              // []
console.log(splice([1, 2, 3], 0, 1));              // [1]
console.log(splice([1, 2, 3], 1, 0, 'a'));         // []

const arr2 = [1, 2, 3];
console.log(splice(arr2, 1, 1, 'two'));             // [2]
console.log(arr2);                                  // [1, "two", 3]

const arr3 = [1, 2, 3];
console.log(splice(arr3, 1, 2, 'two', 'three'));    // [2, 3]
console.log(arr3);                                  // [1, "two", "three"]

const arr4 = [1, 2, 3];
console.log(splice(arr4, 1, 0));                    // []
console.log(splice(arr4, 1, 0, 'a'));               // []
console.log(arr4);                                  // [1, "a", 2, 3]

const arr5 = [1, 2, 3];
console.log(splice(arr5, 0, 0, 'a'));               // []
console.log(arr5);                                  // ["a", 1, 2, 3]
