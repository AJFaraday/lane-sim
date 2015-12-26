class Blocker < Feature

  IMAGE = Gosu::Image.new(
   File.join(
      File.dirname(__FILE__),
      '..', '..', 'images',
      'blocker.png'
    )
  )

  def class_init
    @game.obstacles << self
  end

  def image
    Blocker::IMAGE
  end

  def update
    # Blockers don't do anything.
  end

end