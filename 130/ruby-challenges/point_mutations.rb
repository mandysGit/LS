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

# class DNA
#   def initialize(dna)
#     @dna = dna
#   end

#   def hamming_distance(strand)
#     @dna.size < strand.size ? short = @dna : short = strand
#     @dna.size > strand.size ? long = @dna : long = strand
#     short, long = @dna, strand if @dna.size == strand.size

#     result = 0
#     short.each_char.with_index do |letter, idx|
#       result += 1 if letter != long[idx]
#     end

#     result
#   end
# end

# class DNA
#   def initialize(strand1)
#     @strand1 = strand1
#   end

#   def hamming_distance(strand2)
#     short, long = [@strand1, strand2].sort_by(&:size)

#     distance = 0
#     short.each_char.with_index do |letter, idx|
#       distance += 1 if letter != long[idx]
#     end

#     distance
#   end
# end

class DNA
  def initialize(strand1)
    @strand1 = strand1
  end

  def hamming_distance(strand2)
    short, long = [@strand1, strand2].sort_by(&:size)

    (0...short.size).inject(0) do |distance, idx|
      short[idx] == long[idx] ? distance : distance + 1
    end
  end
end
