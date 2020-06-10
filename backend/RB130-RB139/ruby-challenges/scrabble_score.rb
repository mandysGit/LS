class Scrabble
  def self.score(word)
    letters = word ?  word.scan(/[a-z]/i) : [] 
    letter_scores = {
      ['a','e','i','o','u','l','n','r','s','t'] => 1,
      ['d','g'] => 2,
      ['b','c','m','p'] => 3,
      ['f','h','v','w','y'] => 4,
      ['k'] => 5,
      ['j','x'] => 8,
      ['q','z'] => 10
    }

    letters.reduce(0) { |score, letter| score + self.find_score(letter_scores, letter) }
  end

  def self.find_score(letter_scores, letter)
    score = 0
    letter_scores.each_key do |key|
      return score = letter_scores[key] if key.include?(letter.downcase)
    end
    score 
  end

  def initialize(word)
    @word = word
  end

  def score
    self.class.score(@word)
  end
end




