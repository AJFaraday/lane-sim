class ScoreDisplay

  def initialize(player)
    @player = player
    @game = player.game
    @game.drawable_objects << self
  end

  def draw
    Game::FONT.draw_rel(
      text, 2, 2, 2,
      0, 0,
      1, 1,
      0xff_dddddd
    )
  end

  def text
    "#{@player.score}/#{@game.target}"
  end

end