module Draw

  def draw
    self.image.draw(
      actual_x,
      actual_y,
      z_index
    )
    class_draw if self.respond_to?(:class_draw)
  end

  def z_index
    if self.is_a?(Walker)
      2
    elsif self.is_a?(Player)
      1
    else
      0
    end
  end

  def actual_x
    @x * config['lane_width']
  end

  def actual_y
    @y * config['step_size']
  end

end