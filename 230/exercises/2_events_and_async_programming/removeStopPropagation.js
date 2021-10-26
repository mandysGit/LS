// Without changing the behavior of the following code, 
// remove the call to event.stopPropagation and refactor the result.

/*
BEFORE

`display: none` removes the element from the accessibility tree.
The element and all its descentdants will no longer be annouced by
screen reading technology.

When the user clicks anywhere on the page outside the element with an id
of `container`, the code removes the element. This behaviour is because of event delegation. 

Event delegation takes advantage of event propagation. You can add a single event listener to a common ancestor, the listener then gets invoked for each element.

In the 2nd AddEventListener, `event.stopPropagation()` is invoked to prevent the click event from removing the `container` element when the user clicks the `container` itself or a child of the container. 
*/
document.querySelector('html').addEventListener('click', () => {
  document.querySelector('#container').style = 'display: none';
});

document.querySelector('#container').addEventListener('click', event => {
  event.stopPropagation();
});


/* AFTER
use the contains method to determine whether the `event.target` is 
the `container` element or one of its children.

If `event.target` (the event that is clicked on) is not part of `container`
then the program hides `container`.
*/
document.querySelector('html').addEventListener('click', (event) => {
  const container = document.querySelector('#container');

  if (!container.contains(even.target)) {
    container.style = 'display: none';
  }
});
