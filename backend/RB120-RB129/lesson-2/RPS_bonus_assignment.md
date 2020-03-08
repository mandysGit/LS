## 1) Keeping track of the score

**Implementing Score as a new class**

The attributes and behaviours of the `score` are now encapsulated in its own class. The `Score` instance is responsible for clearing points before the start of a match and keeping a tally of each player's wins and ties. `Score` is now used as a collaborator object for the `Game` class, as shown below:

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

**Implementing Score as a state of an existing class**

I can keep track of the human's score and computer's score by implementing score as an attribute of Player class.

```ruby
class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end
end
```

In this implementation, I am not counting the score of ties since the score is an attribute of a player. Ties are not associated to any players. This approach is readable and simple, given the simple nature of the game at the moment. If the game shifts to a more complex scoring system, then extracting score into it's own class would be better.





