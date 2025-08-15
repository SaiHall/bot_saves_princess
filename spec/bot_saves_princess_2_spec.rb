require "Rspec"
require './lib/grid'

describe Grid do
  before(:each) do
    @grid1 = Grid.new(5, 0, 1, ["-m---\n", "-----\n", "---p-\n", "-----\n", "-----"])
    @grid2 = Grid.new(9, 0, 0, ["m--------\n", "---------\n", "---------\n", "---------\n", "---------\n", "---------\n", "---------\n", "---------\n", "--------p"])
    @grid3 = Grid.new(9, ["m--------\n", "---------\n", "---------\n", "---------\n", "---------\n", "---------\n", "---------\n", "---------\n", "p--------"])
    @grid4 = Grid.new(7, 6, 6, ["p------\n", "-------\n", "-------\n", "-------\n", "-------\n", "-------\n", "------m\n"])
    largest_string = "---------------------------------------------------------------------------------------------------\n"
    largest_array = []
    99.times {largest_array.push(largest_string)}
    largest_array[0] = "m--------------------------------------------------------------------------------------------------\n"
    largest_array[98] = "--------------------------------------------------------------------------------------------------p\n"
    @grid5 = Grid.new(99, 0, 0, largest_array)
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

  it 'can calculate winning moves' do
    expect(@grid1.winning_moves).to eq(["DOWN", "DOWN", "RIGHT", "RIGHT"])
    expect(@grid2.winning_moves).to eq(["DOWN", "DOWN", "DOWN", "DOWN", "DOWN", "DOWN", "DOWN", "DOWN", "RIGHT", "RIGHT", "RIGHT", "RIGHT", "RIGHT", "RIGHT", "RIGHT", "RIGHT"])
    expect(@grid3.winning_moves).to eq(["DOWN", "DOWN", "DOWN", "DOWN", "DOWN", "DOWN", "DOWN", "DOWN"])
    expect(@grid4.winning_moves).to eq(["UP", "UP", "UP", "UP", "UP", "UP", "LEFT", "LEFT", "LEFT", "LEFT", "LEFT", "LEFT"])
  end

  it 'can locate m with or without provided coords' do
    expect(@grid1.m_location).to eq([0, 1])
    expect(@grid3.m_location).to eq([0, 0])
  end

  it 'will work as expected at max size' do
    expect(@grid5.m_location).to eq([0, 0])
    expect(@grid5.p_location).to eq([98, 98])
    expect(@grid5.coord_difference).to eq([-98, -98])

    moves = @grid5.winning_moves

    expect(moves.length).to eq(196)
    expect(moves.include?("DOWN")).to eq(true)
    expect(moves.include?("UP")).to eq(false)
    expect(moves.include?("RIGHT")).to eq(true)
    expect(moves.include?("LEFT")).to eq(false)
  end
end