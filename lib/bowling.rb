class Bowling

  def initialize
    @total = 0
    @score = []
    @spare_score = [0]
  end
  def frame(turn1, turn2 = nil)
    @score << turn1 << turn2
  end

  def calc_strikes
    @score.compact!
    for i in 0..@score.length-1
      if @score[i] == 10
        puts "found a ten"
        @score.insert(i+1, (@score[i] + @score[i + 1] + @score[i + 2]))
        @score.delete_at(i)
        
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
    # puts @spare_score
    @total = @score.inject(:+) + @spare_score.inject(:+)
  end
end