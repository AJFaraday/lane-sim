module Teleport

  attr_accessor :teleport_frame

  def teleport(x, y)
    @x = x
    @y = y
    @teleport_frame = @game.frame
    @stepped = false
    @game.log("#{self.class} teleported to #{@x}:#{@y}")
  end

  def teleported_recently?
    !@stepped
  end

end