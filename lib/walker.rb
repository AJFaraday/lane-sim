class Walker

  # contains position awareness methods
  include WalkerPosition

  # contains movement rules, all of 'update' method
  include WalkerMovement

  # contains drawing rules, all of 'draw' method
  include WalkerDraw

  IMAGE = Gosu::Image.new(
    File.join(
      File.dirname(__FILE__),
      '..', 'images',
      'walker.png'
    )
  )

  attr_accessor :x, :y

  def initialize(game)
    @game = game
    @game.drawable_objects << self
    @game.updatable_objects << self
    @@walkers ||= []
    @@walkers << self

    init_step_time
    init_position
  end

  # step_time is the number of frames it takes to take 1 step
  def init_step_time
    @step_time = (rand(10)* 10)
    @step_time += 10
  end

  def init_position
    @x = rand(config['no_lanes'])
    @y = rand(config['no_steps'])
  end

  def config
    @game.config
  end

  def Walker.at?(x, y)
    @@walkers.detect { |w| w.x == x and w.y == y }
  end

  def other_walker_at?(x, y)
    @@walkers.detect { |w| w.x == x and w.y == y and w != self }
  end

  def index
    @@walkers.index(self)
  end

end