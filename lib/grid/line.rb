class GridLine

  def initialize(start_x, start_y, end_x, end_y)
    @start_x = start_x
    @start_y = start_y
    @end_x = end_x
    @end_y = end_y
  end

  def draw
    Gosu.draw_quad(
      @start_x, @start_y, Gosu::Color::WHITE,
      @start_x + 1, @start_y + 1, Gosu::Color::WHITE,
      @end_x, @end_y, Gosu::Color::WHITE,
      @end_x + 1, @end_y + 1, Gosu::Color::WHITE,
      0
    )
  end

end
