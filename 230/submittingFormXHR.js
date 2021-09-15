// Problem 1
// https://codepen.io/launchschool/pen/abdc4bc9cd4ca051a6b641a8fddb2ed2?editors=0001

document.addEventListener('DOMContentLoaded', () => {
  let store = document.getElementById('store');
  let request = new XMLHttpRequest();
  request.open('GET', 'https://ls-230-web-store-demo.herokuapp.com/products');

  request.addEventListener('load', event => store.innerHTML = request.response);
  request.send();
  
  // EVENT CLICK
  store.addEventListener('click', event =>  {
    let target = event.target;
    if (target.tagName !== 'A') {
      return;
    }
    
    event.preventDefault();
    let request = new XMLHttpRequest();
    request.open('GET', `https://ls-230-web-store-demo.herokuapp.com${target.getAttribute('href')}`);

    request.addEventListener('load', event => store.innerHTML = request.response);
    request.send();
  });
  
 
  
  // EVENT SUBMIT
  store.addEventListener('submit', event => {
    event.preventDefault();
    
    let form = event.target;
    // Why is the event.target form? 
    // The submit event fires on the <form> element itself and not on any <button> 
    // or <input type="submit"> inside it. 
    // https://developer.mozilla.org/en-US/docs/Web/API/HTMLFormElement/submit_event
    let request = new XMLHttpRequest();
    let data = new FormData(form);
   
    request.open('POST', `https://ls-230-web-store-demo.herokuapp.com/products${form.getAttribute('action')}`);
    
    request.addEventListener('load', (event) => {
      console.log(request.response);
      store.innerHTML = request.response
    });
    
    request.send(data);
  });
});
