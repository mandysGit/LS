function makeList() {
  let list = [];

  return function(todo) {
    if (todo) {
      if (!list.includes(todo)) {
        list.push(todo);
        console.log(`${todo} added!`);
        return;
      }

      if (list.includes(todo)) {
        let index = list.indexOf(todo);
        list.splice(index, 1);
        console.log(`${todo} removed!`);
        return;
      }
    } 

    if (list.length === 0) {
      console.log("The list is empty.");
    }

    if (list.length !== 0) {
      list.forEach(todo => console.log(todo));
    }
  }
}

let list = makeList();
list();
list('make breakfast');
list('read book');
list();
list('make breakfast');
list();
