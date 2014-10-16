class Bowling

  def initialize
    @total = 0
  end
  def frame(turn1, turn2)
    @total += turn1 + turn2
  end

  def score
    @total
  end
end