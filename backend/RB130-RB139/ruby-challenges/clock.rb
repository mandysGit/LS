class Clock
  attr_reader :hours, :mins

  def initialize(hours,mins)
    @hours = hours.to_s
    @mins = mins.to_s
  end

  def self.at(hours, mins=0)
    new(hours, mins)
  end

  def to_s
    @hours.prepend('0') if @hours.size == 1
    @mins.prepend('0') if @mins.size == 1

    "#{@hours}:#{@mins}"
  end

  def +(mins)
    total_mins = @hours.to_i * 60 + @mins.to_i + mins
    hours = total_mins / 60
    mins = total_mins % 60
    hours = hours - 24 if hours >= 24
    @hours = hours.to_s
    @mins = mins.to_s
    self
  end

  def -(mins)
    total_mins = @hours.to_i * 60 + @mins.to_i - mins
    hours = total_mins / 60
    mins = total_mins % 60
    hours = hours + 24 if hours < 0
    @hours = hours.to_s
    @mins = mins.to_s
    self
  end

  def ==(other)
    @hours == other.hours && @mins == other.mins
  end
end
