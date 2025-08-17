def displayPathtoPrincess(m, grid)
  working_grid = Grid.new(m, grid)
  # getting array of winning move strings and putting each entry out
  working_grid.winning_moves.each {|direction| puts direction}
end

class Grid
  attr_reader :p_location, :m_location, :grid, :n

  def initialize(n, r = false, c = false, grid)
    @grid = grid
    @n = n
    @p_location = locate_char("p")
    @m_location = bot_location(r, c)
    @coord_diff = coord_difference
  end

  def locate_char(char)
    # finding row provided character is in within grid array
    row_index = @grid.index {|row| row.include?(char)}
    # finding column of character within single row, row is string
    col_index = @grid[row_index].index(char)
    [row_index, col_index]
  end

  def coord_difference
    row_diff = @m_location[0] - @p_location[0]
    col_diff = @m_location[1] - @p_location[1]
    return [row_diff, col_diff]
  end

  def winning_moves
    winning_array = []
    # using difference between two sets of coords to determine direction needed to get to princess
    @coord_diff[0].negative? ? @coord_diff[0].abs.times {winning_array.push("DOWN")} : @coord_diff[0].times {winning_array.push("UP")}
    @coord_diff[1].negative? ? @coord_diff[1].abs.times {winning_array.push("RIGHT")} : @coord_diff[1].times {winning_array.push("LEFT")}
    return winning_array
  end

  def bot_location(r, c)
    # if values provided in args, using provided location. If not, finding m in grid
    r == false ? locate_char('m') : [r, c]
  end
end

m = gets.to_i

grid = Array.new(m)

(0...m).each do |i|
    grid[i] = gets.strip
end

displayPathtoPrincess(m,grid)
