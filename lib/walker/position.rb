module WalkerPosition

  def blocked_in_front?
    Walker.at?(@x, (@y - 1)) or
      (@y == 0 and Walker.at?(@x, (config['no_steps'] - 1)))
  end

end