require 'Rspec'
require './lib/grid'

describe Grid do
  before(:each) do
    @grid1 = Grid.new(3, ["---", "-m-", "--p"])
    @grid2 = Grid.new(7, ["------p", "-------", "-------", "---m---", "-------", "-------", "-------"])
    @grid3 = Grid.new(5, 2, 2, ["-----", "-----", "--m--", "-----", "p----"])
    @grid4 = Grid.new(9, ["p--------", "---------", "---------", "---------", "----m----", "---------", "---------", "---------", "---------"])
  end

  it 'exists and has attributes' do
      expect(@grid1).to be_an_instance_of(Grid)
      expect(@grid1.grid).to eq(["---", "-m-", "--p"])
      expect(@grid1.n).to eq(3)
  end

  it 'can locate p' do
    expect(@grid1.p_location).to eq([2, 2])
    expect(@grid2.p_location).to eq([0, 6])
    expect(@grid3.p_location).to eq([4, 0])
    expect(@grid4.p_location).to eq([0, 0])
  end

  it 'can calculate difference in coords' do
    expect(@grid1.coord_difference).to eq([-1, -1])
    expect(@grid2.coord_difference).to eq([3, -3])
    expect(@grid3.coord_difference).to eq([-2, 2])
    expect(@grid4.coord_difference).to eq([4, 4])
  end

  it 'can calculate winning moves' do
    expect(@grid1.winning_moves).to eq(["DOWN", "RIGHT"])
    expect(@grid2.winning_moves).to eq(["UP", "UP", "UP", "RIGHT", "RIGHT", "RIGHT"])
    expect(@grid3.winning_moves).to eq(["DOWN", "DOWN", "LEFT", "LEFT"])
    expect(@grid4.winning_moves).to eq(["UP", "UP", "UP", "UP", "LEFT", "LEFT", "LEFT", "LEFT"])
  end

  it 'can locate m with or without provided coords' do
    expect(@grid1.m_location).to eq([1, 1])
    expect(@grid3.m_location).to eq([2, 2])
  end
end