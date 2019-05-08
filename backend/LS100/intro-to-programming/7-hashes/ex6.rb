words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

def anagram?(word1, word2)
  chars = word2.chars
  result = true

  chars.each do |char|
    if !word1.include?(char)
      result = false
    end
  end

  result
end

already_seen = []

words.each do |word1|
  arr = []

  words.each do |word2|
    if anagram?(word1, word2) && !already_seen.include?(word2)
      arr << word2
      already_seen << word2
    end
  end

  if !arr.empty?
    puts "-----------"
    p arr
  end
end

######################################################3
result = {}

words.each do |word|
  key = word.split('').sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each_value do |v|
  puts "------"
  p v
end

p result
