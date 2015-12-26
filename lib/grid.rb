class Grid

  def initialize(game)
    @game = game
    @lines = []
    @game.drawable_objects << self
    init_lines
  end

  def init_lines
    config['no_lanes'].times do |lane|
      left = config['lane_width'] * lane
      right = left + config['lane_width']
      top = 0
      bottom = @game.height
      @lines << GridLine.new(left, top, left, bottom)
      @lines << GridLine.new(right, top, right, bottom)
      make_cross_lines(left, right)
    end
  end

  def make_cross_lines(left, right)
    config['no_steps'].times do |step|
      height = config['step_size'] * step
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