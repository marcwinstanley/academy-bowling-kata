require 'bowling'
RSpec.describe "Bowling Kata" do

  it "checks the score if the frame score is less than 10" do
    game = Bowling.new
    game.frame(3, 6)
    expect( game.calc_score).to eq(9)
  end

  it "checks that multiple frame scores are being calculated correctly" do
    game = Bowling.new
    game.frame(3, 6)
    game.frame(7, 1)
    game.frame(2, 2)
    expect(game.calc_score).to eq(21)
  end

  it "checks that strikes are being calculated correctly" do
    game = Bowling.new
    game.frame(10)
    game.frame(10)
    game.frame(2, 2)
    expect(game.calc_score).to eq(40)
  end
  
  it "checks that spares are being calculated correctly" do
    game = Bowling.new
    game.frame(1, 9)
    game.frame(5, 5)
    game.frame(5, 3)
    expect(game.calc_score).to eq(38)
  end

  it "checks that spares and strikes are calculated together" do
    game = Bowling.new
    game.frame(1, 9)
    game.frame(10)
    game.frame(5, 3)
    expect(game.calc_score).to eq(46)
  end

end