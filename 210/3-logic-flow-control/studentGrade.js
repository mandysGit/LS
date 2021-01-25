function studentGrade () {
  let prompt = require('readline-sync');
  let grade1 = prompt.question('Enter score 1: ');
  let grade2 = prompt.question('Enter score 2: ');
  let grade3 = prompt.question('Enter score 3: ');
  let average = Math.floor((Number(grade1) + Number(grade2) + Number(grade3)) / 3);
  let message = 'Based on the average of your 3 scores your letter grade is '

  let grade;
  if (average >= 90) {
    grade = 'A'
  } else if (average >= 70) {
    grade = 'B';
  } else if (average >= 50) {
    grade = 'C';
  } else {
    grade = 'F';
  }

  console.log(message + grade);
}

// studentGrade();

// Further Exploration
function studentGradeFurtherExploration () {
  let prompt = require('readline-sync');
  let grades = [];
  let grade = prompt.question('Enter score or enter n to finish: ');

  while (grade !== 'n') {
    grades.push(grade);
    grade = prompt.question('Enter score or enter n to finish: ');
  };

  let message = `Based on the average of your ${grades.length} scores your letter grade is `
  let avg = average(grades.map(n => Number(n)));

  if (avg >= 90) {
    grade = 'A'
  } else if (avg >= 70) {
    grade = 'B';
  } else if (avg >= 50) {
    grade = 'C';
  } else {
    grade = 'F';
  }

  console.log(message + grade);
}

function average(arr) {
  let sum = arr.reduce((acc, n) => acc + n, 0)
  return Math.floor(sum/arr.length);
}

studentGradeFurtherExploration();
