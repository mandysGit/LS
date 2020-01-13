



ruby 2.6.2p47 (2019-03-13 revision 67232) [x86_64-linux-gnu]
Everyone can modify this shell in real time.
It's a sandbox that works exactly like a native shell.

[1] 2.6.2 > test = [(a..z)]
NameError: undefined local variable or method `a' for main:Object
from (pry):1:in `__pry__'
[2] 2.6.2 > test = [('a'..'z')]
[
    [0] "a".."z"
]
[3] 2.6.2 > test = ['a'..'z']
[
    [0] "a".."z"
]
[4] 2.6.2 > test = ('a'..'z').to_a
[
    [ 0] "a",
    [ 1] "b",
    [ 2] "c",
    [ 3] "d",
    [ 4] "e",
    [ 5] "f",
    [ 6] "g",
    [ 7] "h",
    [ 8] "i",
    [ 9] "j",
    [10] "k",
    [11] "l",
    [12] "m",
    [13] "n",
    [14] "o",
    [15] "p",
    [16] "q",
    [17] "r",
    [18] "s",
    [19] "t",
    [20] "u",
    [21] "v",
    [22] "w",
    [23] "x",
    [24] "y",
    [25] "z"
]
[5] 2.6.2 > ['a','b'].index('b')
1
[6] 2.6.2 >

Mandy ran 67 lines of Ruby: (finished in 1.24s):


From: /home/coderpad/solution.rb @ line 12 :

     7:
     8: # If two words score the same, return the word that appears earliest in the original string.
     9:
    10: # All letters will be lowercase and all inputs will be valid.
    11:
 => 12: p alphabet_score('man i need a taxi up to ubud') == 'taxi'
    13: p alphabet_score('what time are we climbing up the volcano') == 'volcano'
    14: p alphabet_score('take me to semynak') == 'semynak'
    15: p alphabet_score('aa b') == 'aa'
    16:
    17: =begin

NoMethodError: undefined method `alphabet_score' for main:Object
from solution.rb:12:in `<main>'
[1] 2.6.2 >

Mandy ran 67 lines of Ruby: (finished in 1.61s):

3


[1] 2.6.2 >

Mandy ran 68 lines of Ruby: (finished in 1.29s):

3
6


[1] 2.6.2 >

Mandy ran 71 lines of Ruby: (finished in 1.23s):


From: /home/coderpad/solution.rb @ line 12 :

     7:
     8: # If two words score the same, return the word that appears earliest in the original string.
     9:
    10: # All letters will be lowercase and all inputs will be valid.
    11:
 => 12: p alphabet_score('man i need a taxi up to ubud') == 'taxi'
    13: p alphabet_score('what time are we climbing up the volcano') == 'volcano'
    14: p alphabet_score('take me to semynak') == 'semynak'
    15: p alphabet_score('aa b') == 'aa'
    16:
    17: =begin

NoMethodError: undefined method `alphabet_score' for main:Object
from solution.rb:12:in `<main>'
[1] 2.6.2 >

Mandy ran 71 lines of Ruby: (finished in 1.26s):


From: /home/coderpad/solution.rb @ line 12 :

     7:
     8: # If two words score the same, return the word that appears earliest in the original string.
     9:
    10: # All letters will be lowercase and all inputs will be valid.
    11:
 => 12: p alphabet_score('man i need a taxi up to ubud') == 'taxi'
    13: p alphabet_score('what time are we climbing up the volcano') == 'volcano'
    14: p alphabet_score('take me to semynak') == 'semynak'
    15: p alphabet_score('aa b') == 'aa'
    16:
    17: =begin

NoMethodError: undefined method `alphabet_score' for main:Object
from solution.rb:12:in `<main>'
[1] 2.6.2 >

Mandy ran 73 lines of Ruby: (finished in 1.53s):


From: /home/coderpad/solution.rb @ line 67 Object#alphabet_score:

    60: def alphabet_score(str)
    61:   result = {}
    62:   str.split do |word|
    63:     result[word] = find_score(word)
    64:   end
    65:
    66:   highest_score = result.values.max
 => 67:   result.select { |key, _| key.value == highest_score }
    68: end

NoMethodError: undefined method `value' for "man":String
from solution.rb:67:in `block in alphabet_score'
[1] 2.6.2 >

Mandy ran 75 lines of Ruby: (finished in 1.42s):

false


[1] 2.6.2 >

Mandy ran 75 lines of Ruby: (finished in 1.47s):

{"taxi"=>54}
false


[1] 2.6.2 >

Mandy ran 76 lines of Ruby: (finished in 1.23s):


From: /home/coderpad/solution.rb @ line 70 Object#alphabet_score:

    62: def alphabet_score(str)
    63:   result = {}
    64:   str.split do |word|
    65:     result[word] = find_score(word)
    66:   end
    67:
    68:   highest_score = result.values.max
    69:   result_hash = result.select { |key, value| value == highest_score }
 => 70:   result_hash.key
    71: end

ArgumentError: wrong number of arguments (given 0, expected 1)
from solution.rb:70:in `key'
[1] 2.6.2 >

Mandy ran 77 lines of Ruby: (finished in 1.47s):

"taxi"
true


[1] 2.6.2 >

Mandy ran 75 lines of Ruby: (finished in 1.20s):

true
true
true
true


[1] 2.6.2 >
