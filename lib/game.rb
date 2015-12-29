class Game < Gosu::Window

  START_BUTTONS = [
    Gosu::KbUp,
    Gosu::KbDown,
    Gosu::KbRight,
    Gosu::KbLeft
  ]

  include InitUnits
  include InitMap

  attr_accessor :drawable_objects, :updatable_objects
  attr_accessor :grid, :config, :frame, :obstacles

  Game::STEP_SIZE = 20 #px
  Game::LANE_WIDTH = 20 #px

  def initialize(config, map_index)
    @config = config
    @map_index = map_index
    @frame = 0
    @drawable_objects = []
    @updatable_objects = []
    @obstacles = []
    @started = false
    init_map
    init_field

    super(@init_height, @init_width, {})

    init_grid
    init_declared_units
    init_random_units
    init_player
    self.caption = "Lane Simulator"
  end

  def init_grid
    @grid = Grid.new(self)
  end

  def update
    if @started
      updatable_objects.each { |ob| ob.update }
      check_for_players
      @frame += 1
    end
  end

  def check_for_players
    if @config['playable'] and Player.none?
      close
    end
  end

  def draw
    drawable_objects.each { |ob| ob.draw }
  end

  def button_down(id)
    @started = true if START_BUTTONS.include?(id)
    close if id == Gosu::KbEscape
  end

  def log(message)
    puts "#{@frame.to_s.ljust(10)}#{message.ljust(30)}#{Walker.count} #{'#' * Walker.count}"
  end

  def close
    Walker.reset!
    Feature.reset!
    super
  end

end

