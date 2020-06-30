=begin
Problem:
- Given a month and year
- use day method to return day
- return the first, second, third, fourth, last, or teenth day

Algo for day method:
- Find all the days of the month that are `monday`, and store it in an Array
  - Iterate through all the days of the month, use Date#next
  - use Date#monday? to check if it's `monday`
  - if it's `monday` push it into `days` Array

- select the day in `days` Array depending on the schedule
=end
require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    current_date = Date.new(@year, @month, 1)
    days = []

    while current_date.month == @month
      days << current_date.day if validate?(current_date, weekday)
      current_date = current_date.next
    end

    Date.new(@year, @month, select(days, schedule))
  end

  def validate?(date, weekday)
    { monday: date.monday?,
      tuesday: date.tuesday?,
      wednesday: date.wednesday?,
      thursday: date.thursday?,
      friday: date.friday?,
      saturday: date.saturday?,
      sunday: date.sunday? }[weekday]
  end

  def select(days, schedule)
    { first: days.first,
      second: days[1],
      third: days[2],
      fourth: days[3],
      last: days.last,
      teenth: days.find { |day| (13..19).include?(day) } }[schedule]
  end
end
