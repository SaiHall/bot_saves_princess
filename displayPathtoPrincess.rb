require "./lib/grid"

def displayPathtoPrincess(m, grid)
  working_grid = Grid.new(m, grid)
  # .each(&:puts) does not want to work here
  working_grid.winning_moves.each {|direction| puts direction}
end