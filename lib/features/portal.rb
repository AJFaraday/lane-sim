class Portal < Feature

  IMAGE = Gosu::Image.new(
    File.join(
      File.dirname(__FILE__),
      '..', '..', 'images',
      'portal.png'
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
  end

  def update
    Walker.at(@x, @y).each do |walker|
      unless walker.teleported_recently?
        walker.teleport(@counterpart.x, @counterpart.y)
      end
    end
  end


end