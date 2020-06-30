=begin
Problem:
- store students names along with grade they are in

Algo:
- Create School class

instance methods
- to_h
  - return a hash of key: grade, value: Array of names
  - the hash returned should be sorted
  - the value array should be sorted

- add
  - add the grade and name to the hash
- grade
=end

class School
  attr_accessor :school

  def initialize
    @school = {}
  end

  def to_h
    return school if school.empty?
    self.school = school.sort.to_h
    school.each { |_, names| names.sort! }
  end

  def add(name, grade)
    school[grade] << name if !school[grade].nil?
    school[grade] = [name] if school[grade].nil?
  end

  def grade(key)
    return [] if school[key].nil?
    school[key]
  end
end
