class TimeDisplay

  def initialize(game)
    @game = game
    @start_time = Time.now
  end

  def draw
    Game::FONT.draw_rel(
      text,
      (@game.width - 2), 2,
      2,
      1, 0,
      1, 1,
      0xff_dddddd
    )
  end

  def text
    (Time.now.to_i - @start_time.to_i).to_s
  end

end