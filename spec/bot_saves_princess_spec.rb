require 'Rspec'
require './lib/grid'

describe Grid do
  before(:each) do
    @grid1 = Grid.new(3, ["---", "-m-", "--p"])
  end

  it 'exists and has attributes' do
      expect(@grid1).to be_an_instance_of(Grid)
      expect(@grid1.grid).to eq(["---", "-m-", "--p"])
      expect(@grid1.n).to eq(3)
  end

  it 'can locate p' do
    expect(@grid1.p_location).to eq([2, 2])
  end

  it 'can calculate difference in coords' do
    expect(@grid1.coord_difference).to eq([-1, -1])
  end

  it 'can calculate and print winning moves' do
    expect(@grid1.winning_moves).to eq(["DOWN", "RIGHT"])
  end
end