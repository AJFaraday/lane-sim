class Player

  include Draw
  include Movement
  include Teleport
  include Position

  include PlayerScore

  IMAGE = Gosu::Image.new(
    File.join(
      File.dirname(__FILE__),
      '..', 'images',
      'turtle.png'
    )
  )

  def image
    Player::IMAGE
  end

  def initialize(game, x=nil, y=nil, step_time=nil)
    @game = game
    @x = x if x
    @y = y if y
    @step_time = step_time

    @game.drawable_objects << self
    @game.updatable_objects << self
    @@players ||= []
    @@players << self

    init_step_time
    init_position
  end

  def init_position
    @x ||= rand(@game.no_lanes)
    @y ||= rand(@game.no_steps)
    init_position if Walker.at(@x, @y).any? or Feature.at?(@x, @y)
  end

  def init_step_time
    @step_time ||= config['player_step_time']
    @step_time *= 10
  end

  def config
    @game.config
  end

  def update
    read_keys
    check_for_being_run_over
  end

  def read_keys
    pre_read_keys
    if moving_frame?
      if @direction
        self.send("step_#{@direction}")
        @direction = nil
      end
    end
  end

  def pre_read_keys
    if Gosu.button_down?(Gosu::KbUp)
      @direction = 'forward'
    elsif Gosu.button_down?(Gosu::KbDown)
      @direction = 'backward'
    elsif Gosu.button_down?(Gosu::KbLeft)
      @direction = 'left'
    elsif Gosu.button_down?(Gosu::KbRight)
      @direction = 'right'
    end
  end

  def check_for_being_run_over
    if Walker.at(@x, @y).any?
      self.destroy!
    end
  end

  def destroy!
    @game.updatable_objects.delete(self)
    @game.drawable_objects.delete(self)
    @game.log("Player died.")
    @@players.delete(self)
  end

  def self.at(x,y)
    @@players ||= []
    @@players.select{|p| p.x == x and p.y == y}
  end

  def self.none?
    @@players ||= []
    @@players.empty?
  end

  def self.all
    @@players ||= []
    @@players
  end

  def self.reset!
    @@players = []
  end

end