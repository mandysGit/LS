=begin
Algo: 
- check for the shorter string
- assign shorter string to `short`
- assign longer string to `long`
- length_short = short.size
- initialize result = 0 

- loop over short string with index
- check if letter from short string matches letter from modified_long_string
    if it doesn't match, add 1 to result

- return result
=end

class DNA
  def initialize(dna)
    @dna = dna
  end

  def hamming_distance(strand)
    @dna.size < strand.size ? short = @dna : short = strand
    @dna.size > strand.size ? long = @dna : long = strand

    if @dna.size == strand.size
      short = @dna
      long = strand
    end

    result = 0
    short.each_char.with_index do |letter, idx|
      result += 1 if letter != long[idx]
    end

    result
  end
end
