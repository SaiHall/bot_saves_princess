require './lib/grid'

def nextMove(n, r, c, grid)
  working_grid = Grid.new(n, grid)
  # getting array of move strings, and naming the first entry in order to print single move
  next_move = working_grid.winning_moves[0]
  puts next_move
end