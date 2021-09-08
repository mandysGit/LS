// Problem 3
// https://d186loudes4jlv.cloudfront.net/fe2/exercises_objects_and_dom/dom_assignment.html
document.querySelector("#toggle").onclick = function(e) {
  e.preventDefault();
  let notice = document.querySelector("#notice");
  if (notice.getAttribute("class") === "hidden") {
    notice.setAttribute("class", "visible");
  } else {
    notice.setAttribute("class", "hidden");
  }
}

// Problem 4
document.querySelector("#notice").onclick = function(e) {
  e.preventDefault();
  e.current.Target.setAttribute("class", "hidden");
}

// Problem 5
document.querySelector("#multiplication").textContent = String(13 * 9)
document.querySelector("#multiplication").innerText = String(13 * 9)

// Problem 6
document.body.id = 'styled';
document.body.setAttribute('id', 'styled')
