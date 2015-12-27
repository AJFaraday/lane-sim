module Movement

  def moving_frame?
    @step_time > 0 and (@game.frame % @step_time) == 0
  end

  def step_forward
    unless blocked_in_front?
      @y -= 1
      @stepped = true
      loop_back if @y < 0
    end
  end

  def step_backward
    unless blocked_behind?
      @y += 1
      @stepped = true
      loop_back if @y >= config['no_steps']
    end
  end

  def step_right
    unless blocked_right?
      @stepped = true
      @x += 1
    end
  end

  def step_left
    unless blocked_left?
      @x -= 1
      @stepped = true
    end
  end

  def loop_back
    if @y <= 0
      @y = (config['no_steps'] - 1)
    else
      @y = 0
    end
  end

end