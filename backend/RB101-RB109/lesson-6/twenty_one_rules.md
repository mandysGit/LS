#### Rules of Twenty-One

- 52-card deck consisting of the 4 suits (hearts, diamonds, clubs, and  spades), and 13 values (2, 3, 4, 5, 6, 7, 8, 9, 10, jack, queen, king,  ace)

- **objective of game:**  get as close to 21 as possible, without going over

- go over 21, it's a "bust"

- | Card              | Value      |
  | ----------------- | ---------- |
  | 2 - 10            | face value |
  | jack, queen, king | 10         |
  | ace               | 1 or 11    |

- Player turn: the player goes first, and can decide to either "hit" or "stay". A hit means the player will ask for another card. The turn is over when the player either busts or stays. If the player busts, the game is over and the dealer won.
- Dealer turn: when the player stays, it's the dealer's turn. The dealer  must follow a strict rule for determining whether to hit or stay: hit  until the total is at least 17. If the dealer busts, then the player  wins.
- Comparing cards: when both the player and the dealer stay, it's time to  compare the total value of the cards and see who has the highest value.

**Data Structure**

``` ruby
deck = { :hearts   => [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace],
         :diamonds => [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace],
         :clubs    => [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace],
         :spades   => [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace] }
```

**Tests**

```ruby

# Test cases for total method
player = ['ace', 10, 5]
p total(player) == 16

player = ['ace', 5, 5]
p total(player) == 21

player = ['ace','ace', 5, 5]
p total(player) == 12

player = ['ace', 'ace', 5, 4]
p total(player) == 21

player = ['ace','ace', 'ace', 'jack', 5]
p total(player) == 18

player = ['ace', 'ace', 'ace', 5, 3]
p total(player) == 21

player = ['ace','ace', 'ace', 'ace', 'queen', 5]
p total(player) == 19

player = ['ace', 'ace', 'ace', 'ace', 5, 2]
p total(player) == 21
```

