# class BeerSong
#   def initialize
#     @zero_beers = "No more bottles of beer on the wall, no more bottles of beer.\n" \
#       "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

#     @one_beer = "1 bottle of beer on the wall, 1 bottle of beer.\n" \
#       "Take it down and pass it around, no more bottles of beer on the wall.\n"

#     @two_beers = "2 bottles of beer on the wall, 2 bottles of beer.\n" \
#       "Take one down and pass it around, 1 bottle of beer on the wall.\n"
#   end

#   def verse(count)
#     return @zero_beers if count == 0
#     return @one_beer if count == 1
#     return @two_beers if count == 2

#     line_one(count) + line_two(count)
#   end

#   def verses(start, finish)
#     result = ""
#     start.downto(finish) do |count|
#       result << verse(count) << "\n" if count != finish
#       result << verse(count) if count == finish 
#     end
#     result
#   end

#   def lyrics
#     verses(99, 0)
#   end

#   def line_one(count)
#     "#{count} bottles of beer on the wall, #{count} bottles of beer.\n"
#   end

#   def line_two(count)
#     "Take one down and pass it around, #{count - 1} bottles of beer on the wall.\n"
#   end
# end

# BONUS

class BeerSong
  def verse(count)
    count.lyric
    line_one(count) + line_two(count)
  end

  def verses(start, finish)
    result = ""
    start.downto(finish) do |count|
      result << verse(count) << "\n" if count != finish
      result << verse(count) if count == finish 
    end
    result
  end

  def lyrics
    verses(99, 0)
  end

  def line_one(count)
    "#{count} bottles of beer on the wall, #{count} bottles of beer.\n"
  end

  def line_two(count)
    "Take one down and pass it around, #{count - 1} bottles of beer on the wall.\n"
  end
end

class Line
  def lyric
  end
end

class lineZero
  def lyric
  end
end

class lineOne
  def lyric
  end
end

class lineTwo
  def lyric
  end
end
