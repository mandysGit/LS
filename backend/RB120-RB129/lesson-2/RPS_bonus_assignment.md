## 1) Keeping track of the score

<u>**Implementing Score as a new class**</u>

The states and behaviours of the `score` are now encapsulated in its own class. The `Score` instance is responsible for clearing points before the start of a match and keeping a tally of each player's wins and ties. `Score` is now used as a collaborator object for the `Game` class, as shown below:

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

Although it may seem like a good idea to separate `Score` into it's own class, I believe it is too early to do that right now. As the scoring system becomes more complicated, for example, with more than 2 players  or if there's bonus points rewarded for certain situations, then it would make more sense to implement `Score` as it's own class. 

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

It is not necessary to break up the moves into separate subclass for now because my rpsls game is still quite simple. Breaking up the moves into subclasses makes selecting a move and the code more complicated. 

If the game has more rules, and each move had unique features that could not be clearly represented in the behaviour or state of the `Move` class, then I would consider refactoring each move into separate classes. For instance, if Rock has specific rules that only applies to the Rock move, then creating subclasses for each move would make those rules more clear in the code. 

Otherwise, the refactor I did by creating `WIN_COMBINATIONS` constant within the `Move` class is a clear reprersentation of the winning states for each move. It is unecessary at this point to refactor each move into it's own individual subclass. 

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

move_history is a instance variable in Player class:

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

I choose to use the existing `Player` class to keep track of the move history. It makes sense to keep track of the move history as a state of a `Player` because each `Player` ***has a*** move history. Player and move history forms a ***has-a*** relationship. 



 **What will the display output look like?**

Display looks like: 

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

