class Entrance < Feature

  IMAGE = Gosu::Image.new(
    File.join(
      File.dirname(__FILE__),
      '..', '..', 'images',
      'entrance.png'
    )
  )

  def image
    Entrance::IMAGE
  end

  def update
    if spawning_frame? and spot_empty?
      Walker.new(@game, @x, @y)
    end
  end

  def spawning_frame?
    @game.frame % 100 == 0 and
      rand(5) == 0
  end

  def spot_empty?
    Walker.at(@x, @y).none?
  end

end