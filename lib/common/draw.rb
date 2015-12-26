module Draw

  def draw
    self.image.draw(
      actual_x,
      actual_y,
      0
    )
  end

  def actual_x
    @x * config['step_size']
  end

  def actual_y
    @y * config['step_size']
  end

end