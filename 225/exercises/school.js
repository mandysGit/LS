function createStudent(name, year) {
  return {
    name,
    year,
    courses: [],
    info() {
      console.log(`${this.name} is a ${this.year} student.`)
    }, 
    addCourse(course) {
      this.courses.push(course);
    },
    listCourses() {
     console.log(this.courses);
    }, 
    addNote(code, note) {
      let course = this.courses.find(course => course.code === code);

      if (course.hasOwnProperty('note')) {
        course.note = course.note + `; ${note}`;
      } else {
        course.note = `${note}`;
      }
    },
    viewNotes() {
      this.courses.forEach(course => {
       if (course.hasOwnProperty('note')) {
         console.log(`${course.name}: ${course.note}`);
       }
      })
    },
    updateNote(code, note) {
      let course = this.courses.find(course => course.code === code);
      course.note = note;
    },
  }
}

function createSchool() {
  return {
    students: [],

    addStudent(name, year) {
      if (['1st', '2nd', '3rd', '4th', '5th'].includes(year)) {
        let student = createStudent(name, year);
        this.students.push(student);
        return student;
      } else {
        console.log('Invalid Year');
      }
    }, 

    enrollStudent(student, courseCode, courseName) {
      student.addCourse({ name: courseName, code: courseCode});
    },

    addGrade(student, courseCode, grade) {
      let course = student.courses.find(course => course.code === courseCode);
      if (course) course.grade = grade;
    },

    getReportCard(student) {
      student.courses.forEach(course => {
        let {name, grade} = course;
        if (grade === undefined) grade = 'In Progress';
        console.log(`${name}: ${grade}`)
      })
    },

    courseReport(courseName) {
      if (this.getCourseAvg(courseName) === undefined) {
        console.log('undefined');
        return;
      }

      console.log(`=${courseName} Grades=`)

      this.students.forEach(student => {
        let course = student.courses.find(course => course.name === courseName);
        if (course && course.grade) {
          console.log(student.name, ': ', course.grade);
        }
      })

      console.log("---");
      console.log(`Course Average: ${this.getCourseAvg(courseName)}`)
    },

    getCourseAvg(courseName) {
      let result = [];
      let grades = this.students.map(student => {
        let course = student.courses.find(course => course.name === courseName);

        if (course) {
          return course.grade;
        } else {
          return 0;
        }
      });

      grades = grades.filter(grade => grade > 0);
      if (grades.length === 0) return undefined;

      let avg = grades.reduce((current, sum) => current + sum);
      return avg/grades.length;
    }
  }
}

let school = createSchool();
let foo = school.addStudent('foo', '1st');
school.enrollStudent(foo, 101, 'Math');
school.enrollStudent(foo, 102, 'Advanced Math');
school.enrollStudent(foo, 202, 'Physics');
school.addGrade(foo, 101, 95);
school.addGrade(foo, 102, 90);

let bar = school.addStudent('bar', '1st');
school.enrollStudent(bar, 101, 'Math');
school.addGrade(bar, 101, 91);

let qux = school.addStudent('qux', '2nd');
school.enrollStudent(qux, 101, 'Math');
school.enrollStudent(qux, 102, 'Advanced Math');
school.addGrade(qux, 101, 93);
school.addGrade(qux, 102, 90);

school.getReportCard(foo);
school.courseReport('Math');
school.courseReport('Advanced Math');
school.courseReport('Physics');
