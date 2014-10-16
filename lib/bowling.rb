class Bowling

  def initialize
    @frames = 0
    @score = []
    @spare_score = [0]
    @strike_score = [0]
  end

  def frame(turn1, turn2 = nil, turn3 = 0)
    # @frames += 1
    if @frames == 9
      @score << turn1 << turn2 << turn3
    else
      @score << turn1 << turn2
    end
    @frames += 1
  end

  def calc_strikes
    @score.compact!
    @score.each_with_index do |element, index|
      if element == 10 && index < @score.length - 3
        @strike_score << @score[index + 1] << @score[index + 2]
      end
    end
  end

  def calc_spares
    @score.each_with_index do |element, index|
      if index % 2 == 0 && element < 10 && index < 18 && @score[index] + @score[index+1] == 10
        @spare_score << @score[index+2]
      end
    end
  end

  def calc_score
    calc_spares
    calc_strikes
    puts "This is the spares #{@spare_score}"
    puts "This is the strike #{@strike_score}"
    puts "This is the score #{@score}"
    @score.inject(:+) + @spare_score.inject(:+) + @strike_score.inject(:+)
  end
end