class TextAnalyzer
  def process
    text = ''

    File.open("random_text.txt", "r") do |f|
      p f.readlines
    end
  end
end

analyzer = TextAnalyzer.new
analyzer.process
#analyzer.process
#analyzer.process
