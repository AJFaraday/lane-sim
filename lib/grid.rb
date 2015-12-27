class Grid

  def initialize(game)
    @game = game
    @lines = []
    @game.drawable_objects << self
    init_lines
  end

  def init_lines
    @game.no_lanes.times do |lane|
      left = Game::LANE_WIDTH * lane
      right = left + Game::LANE_WIDTH
      top = 0
      bottom = @game.height
      @lines << GridLine.new(left, top, left, bottom)
      @lines << GridLine.new(right, top, right, bottom)
      make_cross_lines(left, right)
    end
  end

  def make_cross_lines(left, right)
    @game.no_steps.times do |step|
      height = Game::STEP_SIZE * step
      @lines << GridLine.new(
        left, height, right, height
      )
    end
  end

  def config
    @game.config
  end

  def draw
    if config['show_grid']
      @lines.each { |line| line.draw }
    end
  end

end