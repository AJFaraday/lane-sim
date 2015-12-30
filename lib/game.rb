class Game < Gosu::Window

  FONT = Gosu::Font.new(26)

  START_BUTTONS = [
    Gosu::KbUp,
    Gosu::KbDown,
    Gosu::KbRight,
    Gosu::KbLeft
  ]

  include InitUnits
  include InitMap
  include GameEndings

  attr_accessor :drawable_objects, :updatable_objects, :game
  attr_accessor :grid, :config, :frame, :obstacles, :status, :target

  Game::STEP_SIZE = 20 #px
  Game::LANE_WIDTH = 20 #px

  def initialize(config, level_index)
    @config = config
    @level_index = level_index
    @frame = 0
    @drawable_objects = []
    @updatable_objects = []
    @obstacles = []
    @started = !@config['playable']
    init_map
    init_field

    super(@init_height, @init_width, {fullscreen: @config['full_screen']})

    init_grid
    init_random_units
    init_player
    init_target
    init_time_display
    self.caption = "Lane Simulator"
  end

  def init_grid
    @grid = Grid.new(self)
  end

  def init_time_display
    @drawable_objects << TimeDisplay.new(self)
  end

  def init_target
    @target ||= config['target']
    @target ||= 10
  end

  def update
    if @started
      updatable_objects.each { |ob| ob.update }
      check_for_players
      check_for_victory
      @frame += 1
    end
  end

  def check_for_players
    if @config['playable'] and Player.none? and @status.nil?
      lose
    end
  end

  def check_for_victory
    Player.all.each do |player|
      if player.score and player.score >= @target
        log("Player has won!")
        win
      end
    end
  end

  def draw
    drawable_objects.each { |ob| ob.draw }
  end

  def button_down(id)
    @started = true if START_BUTTONS.include?(id)
    quit if id == Gosu::KbEscape
    skip if id == Gosu::KbP
  end

  def log(message)
    puts "#{@frame.to_s.ljust(10)}#{message.ljust(30)} Walkers: #{Walker.count} Score: #{score_display}"
  end

  def score_display
    player = Player.all[0]
    if player
      player.score ||= 0
      "#{player.score}/#{@target}"
    else
      ""
    end
  end

end

