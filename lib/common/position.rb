module Position

  attr_accessor :x, :y

  def blocked_in_front?
    @game.any_object_at?(@x, (@y - 1)) or
      (@y == 0 and @game.any_object_at?(@x, (config['no_steps'] - 1)))
  end

  def blocked_behind?
    @game.any_object_at?(@x, (@y + 1)) or
      (@y == config['no_steps'] - 1 and @game.any_object_at?(@x, 0))
  end

  def blocked_right?
    @game.any_object_at?((@x + 1), @y) or
      (@x == (config['no_lanes'] - 1))
  end

  def blocked_right_ahead?
    @game.any_object_at?((@x + 1), (@y - 1)) or
      (@x == (config['no_lanes'] - 1))
  end

  def blocked_left?
    @game.any_object_at?((@x - 1), @y) or
      (@x == 0)
  end

  def blocked_left_ahead?
    @game.any_object_at?((@x - 1), (@y - 1)) or
      (@x == 0)
  end

end