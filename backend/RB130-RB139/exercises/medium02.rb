class TextAnalyzer
  def process
    text = ''

    File.open("random_text.txt", "r") do |f|
      yield(f.read)
      f.close
    end
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.split("\n\n").size} paragraphs" }
analyzer.process { |file| puts "#{file.split("\n").size} lines" }
analyzer.process { |file| puts "#{file.split(' ').size} words" }
