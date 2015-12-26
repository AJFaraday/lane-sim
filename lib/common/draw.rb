module Draw

  def draw
    self.image.draw(
      actual_x,
      actual_y,
      z_index
    )
  end

  def z_index
    if self.is_a?(Walker)
      1
    else
      0
    end
  end

  def actual_x
    @x * config['step_size']
  end

  def actual_y
    @y * config['step_size']
  end

end