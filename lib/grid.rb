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
    else
      draw_edges
    end
  end

  def draw_edges
    draw_top_edge
    draw_bottom_edge
    draw_left_edge
    draw_right_edge
  end

  def draw_top_edge
    Gosu.draw_quad(
      0, 0, Gosu::Color::WHITE,
      0, 1, Gosu::Color::WHITE,
      @game.width, 0, Gosu::Color::WHITE,
      @game.width, 1, Gosu::Color::WHITE,
      0
    )
  end

  def draw_bottom_edge
    Gosu.draw_quad(
      0, @game.height, Gosu::Color::WHITE,
      0, (@game.height - 1), Gosu::Color::WHITE,
      @game.width, @game.height, Gosu::Color::WHITE,
      @game.width, (@game.height - 1), Gosu::Color::WHITE,
      0
    )
  end

  def draw_left_edge
    Gosu.draw_quad(
      0, 0, Gosu::Color::WHITE,
      1, 0, Gosu::Color::WHITE,
      0, @game.height,  Gosu::Color::WHITE,
      1, @game.height, Gosu::Color::WHITE,
      0
    )
  end

  def draw_right_edge
    Gosu.draw_quad(
      @game.width, 0, Gosu::Color::WHITE,
      (@game.width - 1), 0, Gosu::Color::WHITE,
      @game.width, @game.height,  Gosu::Color::WHITE,
      (@game.width - 1), @game.height, Gosu::Color::WHITE,
      0
    )
  end

end