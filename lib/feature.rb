class Feature

  include Draw

  attr_accessor :x, :y

  def initialize(game, x=nil, y=nil)
    @game = game
    @x = x
    @y = y
    init_position
    @game.drawable_objects << self
    @game.updatable_objects << self
    class_init if self.respond_to?(:class_init)
  end

  def config
    @game.config
  end

  def init_position
    @x ||= rand(config['no_lanes'])
    @y ||= rand(config['no_steps'])
  end

  def update
    # update behaviour is defined by specific classes
  end

end