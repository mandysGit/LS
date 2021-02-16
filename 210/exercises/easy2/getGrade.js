function getGrade(n1, n2, n3) {
  const avg = (n1 + n2 + n3) / 3;
  if (avg >= 90 && avg <= 100) {
    return 'A';
  } else if (avg >= 80 && avg < 90) {
    return 'B';
  } else if (avg >= 70 && avg < 80) {
    return 'C';
  } else if (avg >= 60 && avg < 70) {
    return 'D';
  } else {
    return 'F';
  }
}
console.log(getGrade(95, 90, 93));    // "A"
console.log(getGrade(50, 50, 95));    // "D"
