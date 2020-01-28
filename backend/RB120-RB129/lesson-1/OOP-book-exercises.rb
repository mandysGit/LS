class MyCar
  attr_accessor :color, :model, :speed
  attr_reader :year
  
  def initialize(year, model, color)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons } miles per gallon of gas"
  end

  def speed_up(number)
    @speed += number
    puts "You push the gas and accelerate #{number} mph."
  end
  
  def brake(number)
    @speed -= number unless speed == 0
    puts "You push the brake and decelerate #{speed} mph."
  end

  def current_speed
    puts "You are now going #{speed} mph."
  end

  def shut_down
    self.speed = 0
    puts "Car is shut down."
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

  def to_s
    puts "This car is a #{color} #{model} built in the year #{year}"
  end
end


lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina.speed_up(20)
lumina.current_speed
lumina.speed_up(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.shut_down
lumina.current_speed

lumina.color = 'black'
puts lumina.color
puts lumina.year
lumina.spray_paint('red')

MyCar.gas_mileage(13, 351)
puts lumina
my_car = MyCar.new("2010", "Ford Focus", "silver")
puts my_car