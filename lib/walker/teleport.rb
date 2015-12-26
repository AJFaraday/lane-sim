module WalkerTeleport

  attr_accessor :teleport_frame

  def teleport(x, y)
    @x = x
    @y = y
    @teleport_frame = @game.frame
    puts "Walker teleported to #{@x}:#{@y}".ljust(25) +
           ('#' * Walker.all.count)
  end

  def teleported_recently?
    @teleport_frame and
      @teleport_frame > @game.frame - @step_time
  end

end