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
    init_position if other_feature_at?(@x, @y)
  end

  def update
    # update behaviour is defined by specific classes
  end

  def other_feature_at?(x,y)
    @@features.detect{|f| f.x == x and f.y == y and f.x != self.x and f.y != self.y}
  end

  def Feature.at?(x,y)
    @@features.detect{|f| f.x == x and f.y == y}
  end

end