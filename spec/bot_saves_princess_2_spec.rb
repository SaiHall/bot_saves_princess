require "Rspec"
require './lib/grid'

describe Grid do
  before(:each) do
    @grid1 = Grid.new(5, 0, 1, ["-m---\n", "-----\n", "---p-\n", "-----\n", "-----"])
    @grid2 = Grid.new(9, 0, 0, ["m--------\n", "---------\n", "---------\n", "---------\n", "---------\n", "---------\n", "---------\n", "---------\n", "--------p"])
    @grid3 = Grid.new(9, 0, 0, ["m--------\n", "---------\n", "---------\n", "---------\n", "---------\n", "---------\n", "---------\n", "---------\n", "p--------"])
    @grid4 = Grid.new(7, 6, 6, ["p------\n", "-------\n", "-------\n", "-------\n", "-------\n", "-------\n", "------m\n"])
  end

  it 'exists and has attributes' do
      expect(@grid1).to be_an_instance_of(Grid)
      expect(@grid1.grid).to eq(["-m---\n", "-----\n", "---p-\n", "-----\n", "-----"])
      expect(@grid1.n).to eq(5)
  end

  it 'can locate p' do
    expect(@grid1.p_location).to eq([2, 3])
    expect(@grid2.p_location).to eq([8, 8])
    expect(@grid3.p_location).to eq([8, 0])
    expect(@grid4.p_location).to eq([0, 0])
  end

  it 'can calculate difference in coords' do
    expect(@grid1.coord_difference).to eq([-2, -2])
    expect(@grid2.coord_difference).to eq([-8, -8])
    expect(@grid3.coord_difference).to eq([-8, 0])
    expect(@grid4.coord_difference).to eq([6, 6])
  end

  it 'can calculate and print winning moves' do
    expect(@grid1.winning_moves).to eq(["DOWN", "DOWN", "RIGHT", "RIGHT"])
    expect(@grid2.winning_moves).to eq(["DOWN", "DOWN", "DOWN", "DOWN", "DOWN", "DOWN", "DOWN", "DOWN", "RIGHT", "RIGHT", "RIGHT", "RIGHT", "RIGHT", "RIGHT", "RIGHT", "RIGHT"])
    expect(@grid3.winning_moves).to eq(["DOWN", "DOWN", "DOWN", "DOWN", "DOWN", "DOWN", "DOWN", "DOWN"])
    expect(@grid4.winning_moves).to eq(["UP", "UP", "UP", "UP", "UP", "UP", "LEFT", "LEFT", "LEFT", "LEFT", "LEFT", "LEFT"])
  end
end