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

  attr_accessor :counterpart

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
    set_angle_to_counterpart
  end

  def set_angle_to_counterpart
    @angle_to_counterpart = Gosu.angle(
      @x, @y,
      @counterpart.x, @counterpart.y
    ).to_i
  end

  def class_draw
    POINTER_IMAGE.draw_rot(
      (actual_x + 10),
      (actual_y + 10), 0.5,
      @angle_to_counterpart
    )
  end

  def update
    things_here.each do |thing|
      unless thing.teleported_recently?
        thing.teleport(@counterpart.x, @counterpart.y)
      end
    end
  end

end