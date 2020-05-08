# Encrypted Pioneers

=begin
Problem
- Given a word
- use ROT13 to deciper the word
- ROT13 replaces a letter with the 13th letter after it

Data Structure
- input: String
- output: Decipered String

Algo:
- initialize a sorted Array of a - z alphabet, (a..z).to_a 
- There will be 26 letters, index 0 - 25 in the array

- Given a string as an argument
- initialize result = []
- Split the string into an Array of letters
  - loop over each letter
    - IF letter is space, append space and NEXT
    - find the index of the current letter
    - initialize new_index = current letter's index + 13
    - IF the new_index is over 25, reassign new_index
        - minus the number by 14 (to account for the zeroth index)
    - use new_index to reference a letter from alaphet
    - append referenced letter to result

- return result.join
=end

def rot13(names)
  result = []
  alphabet = ('a'..'z').to_a

  names.chars.each do |letter|
    if !alphabet.include? letter.downcase  
      result << letter
    else
      new_index = alphabet.index(letter.downcase) + 13
      new_index = new_index - 26 if new_index > 25
      result << alphabet[new_index]
    end
  end
  p result.join.capitalize
end

names = ["Nqn Ybirynpr",
"Tenpr Ubccre",
"Nqryr Tbyqfgvar",
"Nyna Ghevat",
"Puneyrf Onoontr",
"Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
"Wbua Ngnanfbss",
"Ybvf Unvog",
"Pynhqr Funaaba",
"Fgrir Wbof",
"Ovyy Tngrf",
"Gvz Orearef-Yrr",
"Fgrir Jbmavnx",
"Xbaenq Mhfr",
"Fve Nagbal Ubner",
"Zneiva Zvafxl",
"Lhxvuveb Zngfhzbgb",
"Unllvz Fybavzfxv",
"Tregehqr Oynapu"]

names.each { |name| rot13(name) }
