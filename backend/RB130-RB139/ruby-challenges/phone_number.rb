=begin
 Bad numbers:
- less than 10
- more than 11
- 11 digits, but first number is not 1

Good numbers:
- exactly 10
- 11 digits, but first number is 1, trim first num
=end

class PhoneNumber
  def initialize(num)
    @num = num
  end

  def number
    phone_number = @num.gsub(/[^\w]/, '')
    return '0000000000' if bad?(phone_number)
    return phone_number[1..-1] if phone_number.size == 11 && phone_number[0] == '1'
    phone_number
  end

  def bad?(number)
    number.size < 10 ||
      number.size > 11 ||
      number.size == 11 && number[0] != '1' ||
      number.match?(/[^\d]/)
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{number[0..2]}) #{number[3..5]}-#{number[6..9]}"
  end
end
