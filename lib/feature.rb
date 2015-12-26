class Feature

  include Draw

  attr_accessor :x, :y

  def initialize(game, x=nil, y=nil)
    @game = game
    @x = x
    @y = y
    @@features ||= []
    init_position
    @@features << self
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
    init_position if Feature.at?(@x, @y)
  end

  def update
    # update behaviour is defined by specific classes
  end

  def Feature.at?(x,y)
    @@features.detect{|f| f.x == x and f.y == y}
  end

end