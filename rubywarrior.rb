#Ruby Warrior code through level 5

class Player
  def taking_damage?(warrior)
    warrior.health < @health
  end
  
  def play_turn(warrior)
    if warrior.health < 20 && !taking_damage?(warrior)
      warrior.rest!
    elsif warrior.feel.captive?
        warrior.rescue!
      elsif warrior.feel.enemy?
          warrior.attack!
        else
          warrior.walk!
    end
    @health = warrior.health
  end
end
  
