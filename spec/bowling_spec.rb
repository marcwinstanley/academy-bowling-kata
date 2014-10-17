require 'bowling'
RSpec.describe "Bowling Kata" do

  let(:game){Bowling.new}

  it "checks the score if the frame score is less than 10" do
    game.frame(3, 6)
    expect( game.calc_score).to eq(9)
  end

  it "checks that multiple frame scores are being calculated correctly" do
    game.frame(3, 6)
    game.frame(7, 1)
    game.frame(2, 2)
    expect(game.calc_score).to eq(21)
  end

  it "checks that strikes are being calculated correctly" do
    game.frame(10)
    game.frame(10)
    game.frame(2, 2)
    game.frame(0, 0)
    game.frame(0, 0)
    game.frame(0, 0)
    game.frame(0, 0)
    game.frame(0, 0)
    game.frame(0, 0)
    game.frame(0, 0)
    expect(game.calc_score).to eq(40)
  end
  
  it "checks that spares are being calculated correctly" do
    game.frame(1, 9)
    game.frame(5, 5)
    game.frame(5, 3)
    expect(game.calc_score).to eq(38)
  end

  it "checks that spares and strikes are calculated together" do
    game.frame(1, 9)
    game.frame(10)
    game.frame(5, 3)
    game.frame(0, 0)
    game.frame(0, 0)
    game.frame(0, 0)
    game.frame(0, 0)
    game.frame(0, 0)
    game.frame(0, 0)
    game.frame(0, 0)
    expect(game.calc_score).to eq(46)
  end

  it "checks that a full game can be played" do
    game.frame(1, 9)
    game.frame(10)
    game.frame(5, 3)
    game.frame(1, 9)
    game.frame(10)
    game.frame(5, 3)
    game.frame(1, 9)
    game.frame(10)
    game.frame(10)
    game.frame(10, 9, 1)
    expect(game.calc_score).to eq(191)
  end

  it "checks that a perfect game can be played" do
    game.frame(10)
    game.frame(10)
    game.frame(10)
    game.frame(10)
    game.frame(10)
    game.frame(10)
    game.frame(10)
    game.frame(10)
    game.frame(10)
    game.frame(10, 10, 10)
    expect(game.calc_score).to eq(300)
  end
end