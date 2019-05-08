movies = {
  movie1: 1975,
  movie2: 2004,
  movie3: 2013,
  movie4: 2001,
  movie5: 1981
}

movie_list = Hash.new
movie_list[:movie1] = 1975
movie_list[:movie2] = 2004
movie_list[:movie3] = 2013
movie_list[:movie4] = 2001
movie_list[:movie5] = 1981

puts "movies:"
movies.each {|k,v| puts v}

puts "movie list:"
movie_list.each {|k,v| puts v}