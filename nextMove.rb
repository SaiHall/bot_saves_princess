require './lib/grid'

def nextMove(n, r, c, grid)
  working_grid = Grid.new(n, grid)
  next_move = working_grid.winning_moves[0]
  puts next_move
end