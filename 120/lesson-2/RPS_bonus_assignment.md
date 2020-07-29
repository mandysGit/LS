## 1) Keeping track of the score

<u>**Implementing Score as a new class**</u>

The `Score` instance is responsible for clearing points before the start of a match and keeping a tally of each player's wins and ties. `Score` is  a collaborator object for the `Game` class, as shown below:

```ruby
class Game
  WIN_SCORE = 2
  attr_accessor :human, :computer
  attr_reader :score

  def initialize
    @human = Human.new
    @computer = Computer.new
    @score = Score.new
  end
  #....
```

I believe it is too early to separate `Score` into a separte class. As the scoring system becomes more complicated, for example, with more than 2 players  or if there are bonus points rewarded for certain situations, then it would make more sense to implement `Score` as it's own class. 

The rps game is still quite simple, and I think it is easier to reason about the score by implementing it as a state of an existing class. 

<u>**Implementing Score as a state of an existing class**</u>

I can keep track of the human's score and computer's score by implementing score as an state of Player class.

```ruby
class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end
end
```

In this implementation, I am not counting the score of ties since the score is an state of a player. Ties are not associated to any players. This approach is readable and simple, given the simple nature of the game at the moment. If the game shifts to a more complex scoring system, then extracting score into it's own class would be better.



## 3) Add a class for each Move

I've added new classes for each move. Each move is a subclass of `Move` class:

```ruby
class Rock < Move; end
class Paper < Move; end
class Scissors < Move; end
class Lizard < Move; end
class Spock < Move; end
```

This makes selecting the move more complicated. I've added a private instance method, `select_move` inside the `Player` class. This method assigns `self.move` a new instance of a move subclass. 

```ruby


class Player
#...
  private
  
  def select_move(choice)
    case choice
    when 'r' then self.move = Rock.new(choice)
    when 'p' then self.move = Paper.new(choice)
    when 'sc' then self.move = Scissors.new(choice)
    when 'l' then self.move = Lizard.new(choice)
    when 'sp' then self.move = Spock.new(choice)
    end
  end
end
```

**<u>Discussion Pros & Cons</u>**

It is not necessary to break up the moves into separate subclass for now because my rpsls game is still simple. Breaking up the moves into subclasses makes selecting a move and the code more complicated. 

If the game has more rules, and each move had unique features that could not be clearly represented in the behaviour or state of the `Move` class, then I would consider refactoring each move into separate classes. For instance, if Rock has specific rules that only applies to the Rock move, then creating subclasses for each move would make those rules more clear in the code. 

The refactor I did by creating `WIN_COMBINATIONS` constant within the `Move` class is a clear representation of the winning states for each move.

```ruby 
class Move
  VALUES = ['r', 'p', 'sc', 'sp', 'l']

  WIN_COMBINATIONS = {
    'r' => ['l', 'sc'],
    'l' => ['p', 'sp'],
    'sp' => ['r', 'sc'],
    'sc' => ['l', 'p'],
    'p' => ['r', 'sp']
  }

  def initialize(value)
    @value = value
  end

  def to_s
    value
  end

  def >(other_move)
    WIN_COMBINATIONS[value].include?(other_move.to_s)
  end

  private

  attr_reader :value
end
```



## 4) Keep track of a history of moves

**What data structure will you reach for?**

I used an Array to keep track of Player's move history. The Array is an order list, so it keeps all the Player's moves in order, from the first move until the last move. 

move_history is a state of the Player class:

```ruby
class Player
  attr_accessor :move, :name, :score, :move_history

  def initialize
    set_name
    @score = 0
    @move_history = []
  end
end
```

**Will you use a new class, or an existing class?**

I use the existing `Player` class to keep track of the move history. It makes sense to keep track of the move history as a state of a `Player` because each `Player` has a move history.

 **What will the display output look like?**

```ruby
~~~~~Game Recap~~~~~

Match 1:
Mandy chose r
Hal chose r 

Match 2:
Mandy chose r
Hal chose sc

Match 3:
Mandy chose r
Hal chose sc

Match 4:
Mandy chose r
Hal chose sc
```



## 5) Computer Personalities

I implemented each computer personality as a subclass of Computer, by following the ruby clean code guidelines: https://github.com/uohzxela/clean-code-ruby#avoid-conditionals

```ruby

class Computer < Player
  def initialize
    @personality = [R2D2, Hal, Chappie, Sonny, Number5].sample.new
    super
  end

  def choose
    self.move = personality.choose
    move_history << move.to_s
  end

  private

  attr_reader :personality

  def set_name
    self.name = personality.name
  end
end

class R2D2 < Computer
  def initialize; end

  def choose
    Move.new('r')
  end

  def name
    self.class.to_s
  end
end

class Hal < Computer
  def initialize; end

  def choose
    Move.new(%w(sc sc sc sc sp sp l l r).sample)
  end

  def name
    self.class.to_s
  end
end

class Chappie < Computer
  def initialize; end

  def choose
    Move.new(%w(l l l l l sp p sc r).sample)
  end

  def name
    self.class.to_s
  end
end

class Sonny < Computer
  def initialize; end

  def choose
    Move.new('p')
  end

  def name
    self.class.to_s
  end
end

class Number5 < Computer
  def initialize; end

  def choose
    Move.new(Move::VALUES.sample)
  end

  def name
    self.class.to_s
  end
end
```



Prior to dividing up each personality into subclass, I had a case statement within `choose` instance method:

```ruby
class Computer < Player
  def choose
    case name
    when 'R2D2' then self.move = Move.new('r')
    when 'Hal' then self.move = Move.new(['sc', 'sc','sc','r'].sample)
    when 'Chappie' then self.move = Move.new(['p', 'p','p','r'].sample)
    when 'Sonny' then self.move = Move.new(['sp', 'sp','sp','r','l'].sample)
    when 'Number 5' then self.move = Move.new(Move::VALUES.sample)
    end
    move_history << move.to_s
  end

  private

  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end
end
```

