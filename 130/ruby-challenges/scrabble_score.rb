class Scrabble
  def initialize(word)
    @letters = word ? word.scan(/[a-z]/i) : [] 
    @letter_scores = {
      %w(a e i o u l n r s t) => 1,
      %w(d g) => 2,
      %w(b c m p) => 3,
      %w(f h v w y) => 4, 
      %w(k) => 5,
      %w(j x) => 8,
      %w(q z) => 10
    }
  end

  def self.score(word)
    new(word).score
  end

  def score
    @letters.reduce(0) { |score, letter| score + find_score(@letter_scores, letter) }
  end

  def find_score(letter_scores, letter)
    score = 0
    letter_scores.each_key do |key|
      return score = letter_scores[key] if key.include?(letter.downcase)
    end
    score 
  end
end




