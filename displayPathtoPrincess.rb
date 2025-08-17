require "./lib/grid"

def displayPathtoPrincess(m, grid)
  working_grid = Grid.new(m, grid)
  # getting array of winning move strings and putting each entry out
  working_grid.winning_moves.each {|direction| puts direction}
end