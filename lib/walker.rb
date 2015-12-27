class Walker

  # contains position awareness methods
  include Position

  # contains movement rules, all of 'update' method
  include Movement
  include WalkerMovement

  # contains drawing rules, all of 'draw' method
  include Draw

  include Teleport

  IMAGE = Gosu::Image.new(
    File.join(
      File.dirname(__FILE__),
      '..', 'images',
      'walker.png'
    )
  )

  def initialize(game, x=nil, y=nil, step_time=nil)
    @game = game
    @x = x if x
    @y = y if y
    @step_time = step_time

    @game.drawable_objects << self
    @game.updatable_objects << self
    @@walkers ||= []
    @@walkers << self

    init_step_time
    init_position

    @game.log("Walker added")
  end

  # step_time is the number of frames it takes to take 1 step
  def init_step_time
    @step_time ||= (rand(10)* 10)
    @step_time += 10
  end

  def init_position
    @x ||= rand(@game.no_lanes)
    @y ||= rand(@game.no_steps)
  end

  def config
    @game.config
  end

  def Walker.at(x, y)
    @@walkers ||= []
    @@walkers.select { |w| w.x == x and w.y == y }
  end

  def other_walker_at?(x, y)
    @@walkers.detect { |w| w.x == x and w.y == y and w != self }
  end

  def index
    @@walkers.index(self)
  end

  def self.all
    @@walkers
  end

  def self.count
    @@walkers.count
  end

  # Polymorphic method, done differently elsewhere.
  def image
    Walker::IMAGE
  end

  def destroy!
    @game.updatable_objects.delete(self)
    @game.drawable_objects.delete(self)
    @@walkers.delete(self)
    @game.log("Walker removed")
  end

end