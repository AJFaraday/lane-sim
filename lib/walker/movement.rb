module WalkerMovement

  def update
    take_step if moving_frame? and !blocked_in_front?
  end

  def moving_frame?
    (@game.frame % @step_time) == 0
  end

  def take_step
    @y -= 1
    loop_back if @y < 0
  end

  def loop_back
    @y = (config['no_steps'] - 1)
  end

end