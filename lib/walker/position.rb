module WalkerPosition

  def blocked_in_front?
    other_walker_at?(@x, (@y - 1)) or
      (@y == 0 and other_walker_at?(@x, (config['no_steps'] - 1)))
  end

  def blocked_right?
    other_walker_at?((@x + 1), @y) or
      (@x == (config['no_lanes'] - 1))
  end

  def blocked_left?
    other_walker_at?((@x - 1), @y) or
      (@x == 0)
  end

end