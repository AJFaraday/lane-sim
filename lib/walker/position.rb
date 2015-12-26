module WalkerPosition

  def blocked_in_front?
    any_object_at?(@x, (@y - 1)) or
      (@y == 0 and any_object_at?(@x, (config['no_steps'] - 1)))
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

  def blocking_behind?
    other_walker_at?(@x, (@y + 1))
  end

end