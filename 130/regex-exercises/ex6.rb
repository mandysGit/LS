def format_date(str)
  str.split('-').reverse.join('.')
end

def format_date(str)
  str.sub(/\A(\d\d\d\d)-(\d\d)-(\d\d)\z/, '\3.\2.\1')
end

p format_date('2016-06-17') == '17.06.2016'
p format_date('2016/06/17') == '2016/06/17'
