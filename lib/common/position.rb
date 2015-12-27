module Position

  attr_accessor :x, :y

  def blocked_in_front?
    any_object_at?(@x, (@y - 1)) or
      (@y == 0 and any_object_at?(@x, (config['no_steps'] - 1)))
  end

  def blocked_behind?
    any_object_at?(@x, (@y + 1)) or
      (@y == config['no_steps'] - 1 and any_object_at?(@x, 0))
  end

  def blocked_right?
    any_object_at?((@x + 1), @y) or
      (@x == (config['no_lanes'] - 1))
  end

  def blocked_right_ahead?
    any_object_at?((@x + 1), (@y - 1)) or
      (@x == (config['no_lanes'] - 1))
  end

  def blocked_left?
    any_object_at?((@x - 1), @y) or
      (@x == 0)
  end

  def blocked_left_ahead?
    any_object_at?((@x - 1), (@y - 1)) or
      (@x == 0)
  end

  def any_object_at?(x, y)
    walker_at_position = Walker.all.detect { |w| w.x == x and w.y == y and w != self }
    if self.is_a?(Walker)
      obstacles_in_position = @game.obstacles.detect { |f| f.x == x and f.y == y }
    else
      obstacles_in_position = @game.obstacles.detect { |f| f.x == x and f.y == y and !f.is_a?(Coin) }
    end
    walker_at_position or obstacles_in_position
  end

end