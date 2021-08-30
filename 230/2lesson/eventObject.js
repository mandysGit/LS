// Problem 1 https://codepen.io/launchschool/pen/BQoBox
document.addEventListener('click', event => {
  let x = document.querySelector('.x');
  x.style.left = `${event.clientX}px`;
  x.style.top = `${event.clientY}px`;
})

// Problem 2
document.addEventListener('mousemove', event => {
  let x = document.querySelector('.x');
  x.style.left = `${event.clientX}px`;
  x.style.top = `${event.clientY}px`;
})

// Problem 3 https://codepen.io/launchschool/pen/zoBdbj
document.addEventListener('mousemove', event => {
  let x = document.querySelector('.x');
  x.style.left = `${event.clientX}px`;
  x.style.top = `${event.clientY}px`;
})

document.addEventListener('keydown', event => {
  let x = document.querySelector('.x');
  x.firstElementChild.style.background = color(event.key);
  x.lastElementChild.style.background = color(event.key);
})

function color(key) {
  if (key === 'b') {
    return 'blue'
  } else if (key === 'r') {
    return 'red'
  } else if (key === 'g') {
    return 'green'
  }
}

// Problem 4 https://codepen.io/launchschool/pen/WowEow
document.addEventListener('DOMContentLoaded', event => {
  let counter = document.querySelector('.counter');
  let textarea = document.querySelector('textarea');
  let button = document.querySelector('button');
   

  function updateCounter() {
    const CHARACTER_LIMIT = 140;
    let characterCount = textarea.value.length;
    let remaining = CHARACTER_LIMIT - characterCount;
    let isInvalid = remaining < 0;

    textarea.classList.toggle('invalid', isInvalid);
    button.disabled = isInvalid;
    counter.textContent = `${remaining} characters remaining`;
  }


  textarea.addEventListener('keyup', updateCounter)
  updateCounter();
})
