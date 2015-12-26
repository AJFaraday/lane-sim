class Walker

  IMAGE = Gosu::Image.new(
    File.join(
      File.dirname(__FILE__),
      '..', 'images',
      'walker.png'
    )
  )

  attr_accessor :x, :y

  def initialize(game,x=0,y=0)
    @game = game
    @game.drawable_objects << self
    @game.updatable_objects << self
    @x = x
    @y = y
  end

  def config
    @game.config
  end
  
  def draw
    IMAGE.draw(
      actual_x,
      actual_y,
      0
    )
  end

  def update
    #TODO
  end

  def actual_x
    @x * config['step_size']
  end
  
  def actual_y
    @y * config['step_size']
  end
  
end