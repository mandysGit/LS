def types(arr)
  yield(arr)
end

cat_breeds = ['bengal', 'russian blue', 'traditional persian', 'doll-face persian']
types(cat_breeds) { |_, _, *persian_cats| puts "Persian Cats: #{persian_cats.join(', ')}." }
