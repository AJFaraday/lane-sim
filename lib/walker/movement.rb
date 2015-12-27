# This relies on methods from lib/common/movement.rb
module WalkerMovement

  def update
    take_step if moving_frame?
  end

  def take_step
    @moved_in_step = false
    consider_going_down
    return if @moved_in_step
    if not blocked_in_front?
      step_forward
    elsif not blocked_right? and not blocked_right_ahead?
      step_right
    elsif not blocked_left? and not blocked_left_ahead?
      step_left
    end
  end

  def consider_going_down
    @move_down_count ||= 0
    if blocked_left?
      @move_down_count = 0
    else
      @move_down_count += 1
    end
    if @move_down_count > 10 and not blocked_left?
      step_left
      @move_down_count = 0
      @moved_in_step = true
    end
  end



end