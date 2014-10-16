class Bowling

  def initialize
    @total = 0
    @score = []
  end
  def frame(turn1, turn2 = nil)
    @score << turn1 << turn2
  end

  def calc_strikes
    @score.compact!
    # @score.reverse!
    for i in 0..@score.length-1
      if @score[i] == 10
        puts "found a ten"
        @score.insert(i+1, (@score[i] + @score[i + 1] + @score[i + 2]))
        @score.delete_at(i)
        
      end
    end

  end

  def calc_score
    calc_strikes
    puts @score
    @total = @score.inject(:+)
  end
end