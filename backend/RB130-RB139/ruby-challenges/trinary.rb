=begin
Algo:
- Return 0 if string matches anything that's not 0, 1, or 2
- Convert String to array of chars
- Transform each char to Integer, then multiply by 2 to the exp of idx
- use reduce to sum all numbers
=end

class Trinary
  def initialize(trinary)
    @trinary = trinary
  end

  def to_decimal
    return 0 if @trinary.match(/[^0-2]/)
    
    @trinary.reverse
            .chars
            .map
            .with_index { |n, idx| n.to_i * 3**idx }
            .inject(:+)
  end
end
