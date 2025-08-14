require "pry"

class Grid
  attr_reader :p_location, :grid, :n

  def initialize(n, grid)
    @grid = grid
    @n = n
    @p_location = locate_char("p")
    @m_location = locate_char("m")
    @coord_diff = coord_difference()
  end

  def locate_char(char)
    row_index = @grid.index {|row| row.include?(char)}
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
    @coord_diff[0].negative? ? @coord_diff[0].abs.times {winning_array.push("DOWN")} : @coord_diff[0].times {winning_array.push("UP")}
    @coord_diff[0].negative? ? @coord_diff[1].abs.times {winning_array.push("RIGHT")} : @coord_diff[0].times {winning_array.push("LEFT")}
    return winning_array
  end
end