require "Rspec"
require './lib/grid'

describe Grid do
  before(:each) do
    @grid1 = Grid.new(5, 0, 1, ["-m---\n", "-----\n", "---p-\n", "-----\n", "-----"])
  end

  it 'exists and has attributes' do
      expect(@grid1).to be_an_instance_of(Grid)
      expect(@grid1.grid).to eq(["-m---\n", "-----\n", "---p-\n", "-----\n", "-----"])
      expect(@grid1.n).to eq(5)
  end

    it 'can locate p' do
    expect(@grid1.p_location).to eq([2, 3])
  end

  it 'can calculate difference in coords' do
    expect(@grid1.coord_difference).to eq([-2, -2])
  end

  it 'can calculate and print winning moves' do
    expect(@grid1.winning_moves).to eq(["DOWN", "DOWN", "RIGHT", "RIGHT"])
  end
end