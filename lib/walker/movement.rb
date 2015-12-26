module WalkerMovement

  def update
    take_step if moving_frame?
  end

  def moving_frame?
    @step_time > 0 and (@game.frame % @step_time) == 0
  end

  def take_step
    if not blocked_in_front?
      if blocking_behind? and not blocked_left?
        step_left
      else
        step_forward
      end
    elsif not blocked_right?
      step_right
    elsif not blocked_left?
      step_left
    end
  end

  def step_forward
    @y -= 1
    loop_back if @y < 0
  end

  def step_right
    @x += 1
  end

  def step_left
    @x -= 1
  end

  def loop_back
    @y = (config['no_steps'] - 1)
  end

end