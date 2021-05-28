const franchise = {
  name: 'How to Train Your Dragon',
  allMovies() {
    return [1, 2, 3].map(function(number) {
      return `${this.name} ${number}`;
    });
  },
};

// Output
// [
//   'How to Train Your Dragon 1',
//   'How to Train Your Dragon 2',
//   'How to Train Your Dragon 3'
// ]

/* 
`franchise.allMovies()` on line 9 is a method invocation. Method invocations in JS 
implicitly bind `this` to the calling object. 

On line 18 - 15, within the function body of `allMovies`, the function returns
a new Array that is returned from invoking `map` on Array [1, 2, 3]. 

The callback function that is passed to `map` method creates an inner scope.
In JS, inner scopes do not automatically have the same context as the outer scope and that's why
`this` on line 24 references the global object `franchise.allMovies()` is invoked on line 9.

To have `this` reference the `franchise` object when `allMovies` is invoked 
on line `21`, we need to use an arrow function because arrow functions don't create
their own `this` binding. The value of `this` within an arrow function is determined lexically.

Another solution is to declare a variable `self` that points to `this` within the outer scope of the `allMoves` method.
Then reference `self` within the anonymous callback function.
*/

const franchise = {
  name: 'How to Train Your Dragon',
  allMovies: function() {
    return [1, 2, 3].map(function(number) {
      return `${this.name} ${number}`;
    }.bind(this));
  }
}

/* `map` method and a few other methods on Array.prototype give us 
a way to set the execution context of a callback. Passing the execution context 
as a second argument to these methods, it will be treated as the context within the callback. .
*/
const franchise = {
  name: 'How to Train Your Dragon',
  allMovies: function() {
    return [1, 2, 3].map(function(number) {
      return `${this.name} ${number}`;
    }, this)
  }
}

const franchise = {
  name: 'How to Train Your Dragon',
  allMovies() {
    return [1, 2, 3].map(number =>{
      return `${this.name} ${number}`;
    });
  },
};

const franchise = {
  name: 'How to Train Your Dragon',
  allMovies() {
    const self = this;
    return [1, 2, 3].map(function(number){
      return `${self.name} ${number}`;
    });
  },
};

console.log(franchise.allMovies())
