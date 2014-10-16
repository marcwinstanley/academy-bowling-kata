class Bowling

  def initialize
    @total = 0
    @score = []
    @spare_score = [0]
    @strike_score = [0]
  end

  def frame(turn1, turn2 = nil)
    @score << turn1 << turn2
  end

  def calc_strikes
    @score.compact!
    @score.each_with_index do |element, index|
      if element == 10
        @strike_score << @score[index + 1] << @score[index + 2]
      end
    end
  end

  def calc_spares
    @score.each_with_index do |element, index|
      if index % 2 == 0 && element < 10 && @score[index] + @score[index+1] == 10
        @spare_score << @score[index+2]
      end
    end
  end

  def calc_score
    calc_spares
    calc_strikes
    @total = @score.inject(:+) + @spare_score.inject(:+) + @strike_score.inject(:+)
  end
end