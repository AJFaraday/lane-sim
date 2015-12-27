class Feature

  include Draw

  attr_accessor :x, :y

  def initialize(game, x=nil, y=nil, attrs={})
    @game = game
    @x = x
    @y = y
    @attrs = attrs
    @@features ||= []
    @@features << self
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
    self.teleport if other_feature_at?(@x, @y)
  end

  def teleport
    @x = rand(config['no_lanes'])
    @y = rand(config['no_steps'])
    self.teleport if other_feature_at?(@x, @y) or Walker.at(@x, @y).any?
  end

  def update
    # update behaviour is defined by specific classes
  end

  def other_feature_at?(x,y)
    @@features.detect{|f| f.x == x and f.y == y and f != self}
  end

  def Feature.at?(x,y)
    @@features.detect{|f| f.x == x and f.y == y}
  end

  def things_here
    things = []
    things << Walker.at(@x, @y)
    things << Player.at(@x, @y)
    things.flatten
  end

end