let studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

function sum(grades) {
  return grades.reduce((acc, current) => acc + current);
}

function getLetterGrade(num) {
  if (num > 92) {
    return '(A)'
  } else if (num > 84 && num < 93) {
    return '(B)' 
  } else if (num > 76 && num < 84) {
    return '(C)' 
  } else if (num > 68 && num < 77) {
    return '(D)'
  } else if (num > 59 && num < 69) {
    return '(E)'
  } else {
    return '(F)'
  }
}

function getStudentGrades(exams, exercises) {
  let result = [];

  exams.forEach((examGrade, index) => {
    let numberGrade = Math.round(examGrade * .65 + exercises[index] * .35);
    let letterGrade = getLetterGrade(numberGrade);
    result.push(`${numberGrade} ${letterGrade}`);
  })

  return result;
}


function getExamAverageMinMax(scores) {
  let result = [];

  scores.forEach(arr => {
    let grades = [];

    arr.forEach((grade, idx) => {
      grades.push(grade);
    })

    let avg = sum(grades) / grades.length;
    let min = Math.min(...grades);
    let max = Math.max(...grades);

    result.push({ average: avg, minimum: min, maximum: max });
  })

  return result;
}

function transpose(arr) {
  let newArr = [];

  for (let i = 0; i< arr[0].length; i++) {
    newArr.push([]);
  }

  for (let row = 0; row < arr.length; row++) {
    for (let col = 0; col < arr[row].length; col++) {
      newArr[col].push(arr[row][col]);
    }
  }

  return newArr;
}

function generateClassRecordSummary(scores) {
  let examScores = Object.keys(scores).map(student => scores[student].scores.exams);
  let exerciseScores = Object.keys(scores).map(student => scores[student].scores.exercises);
  let examScoresInverted = transpose(examScores);

  let avgExamScores = examScores.map(arr => sum(arr) / arr.length);
  let totalExerciseScores = exerciseScores.map(arr => sum(arr));

  return {
    studentGrades: getStudentGrades(avgExamScores, totalExerciseScores), 
    exams: getExamAverageMinMax(examScoresInverted),
  };
}


console.log(generateClassRecordSummary(studentScores));

// returns:
// {
//   studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
//   exams: [
//     { average: 75.6, minimum: 50, maximum: 100 },
//     { average: 86.4, minimum: 70, maximum: 100 },
//     { average: 87.6, minimum: 60, maximum: 100 },
//     { average: 91.8, minimum: 80, maximum: 100 },
//   ],
// }
