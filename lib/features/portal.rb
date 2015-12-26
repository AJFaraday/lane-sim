class Portal < Feature

  IMAGE = Gosu::Image.new(
    File.join(
      File.dirname(__FILE__),
      '..', '..', 'images',
      'portal.png'
    )
  )

  POINTER_IMAGE = Gosu::Image.new(
    File.join(
      File.dirname(__FILE__),
      '..', '..', 'images',
      'portal-pointer.png'
    )
  )

  def image
    Portal::IMAGE
  end

  def class_init
    @counterpart = @attrs[:counterpart]
    @counterpart ||= Portal.new(
      @game,
      nil, nil,
      counterpart: self
    )
    @angle_to_counterpart = Gosu.angle(
      @x, @y,
      @counterpart.x, @counterpart.y
    )
  end

  def class_draw
    POINTER_IMAGE.draw_rot(
      (actual_x + 10),
      (actual_y + 10), 0.5,
      @angle_to_counterpart
    )
  end

  def update
    Walker.at(@x, @y).each do |walker|
      unless walker.teleported_recently?
        walker.teleport(@counterpart.x, @counterpart.y)
      end
    end
  end

end