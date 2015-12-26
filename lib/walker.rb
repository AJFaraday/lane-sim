class Walker

  # contains position awareness methods
  include WalkerPosition

  # contains movement rules, all of 'update' method
  include WalkerMovement

  # contains drawing rules, all of 'draw' method
  include Draw

  IMAGE = Gosu::Image.new(
    File.join(
      File.dirname(__FILE__),
      '..', 'images',
      'walker.png'
    )
  )

  attr_accessor :x, :y

  def initialize(game, x=nil, y=nil)
    @game = game
    @x = x if x
    @y = y if y
    @game.drawable_objects << self
    @game.updatable_objects << self
    @@walkers ||= []
    @@walkers << self

    init_step_time
    init_position

    puts "Walker added".ljust(20) +
           ('#' * @@walkers.count)

  end

  # step_time is the number of frames it takes to take 1 step
  def init_step_time
    @step_time = (rand(10)* 10)
    @step_time += 10
  end

  def init_position
    @x ||= rand(config['no_lanes'])
    @y ||= rand(config['no_steps'])
  end

  def config
    @game.config
  end

  def Walker.at(x, y)
    @@walkers.select { |w| w.x == x and w.y == y }
  end

  def other_walker_at?(x, y)
    @@walkers.detect { |w| w.x == x and w.y == y and w != self }
  end

  def any_object_at?(x, y)
    @@walkers.detect { |w| w.x == x and w.y == y and w != self } or
      @game.obstacles.detect { |f| f.x == x and f.y == y }
  end

  def index
    @@walkers.index(self)
  end

  def all
    @@walkers
  end

  # Polymorphic method, done differently elsewhere.
  def image
    Walker::IMAGE
  end

  def destroy!
    @game.updatable_objects.delete(self)
    @game.drawable_objects.delete(self)
    @@walkers.delete(self)
    puts "Walker removed".ljust(20) +
           ('#' * @@walkers.count)
  end

end