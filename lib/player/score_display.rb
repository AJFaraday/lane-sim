class ScoreDisplay

  def initialize(player)
    @player = player
    @game = player.game
  end

  def draw
    Game::FONT.draw_rel(
      text, 2, 2, 2,
      0, 0,
      1, 1,
      0xff_aaaaaa
    )
  end

  def text
    "#{@player.score}/#{@game.target}"
  end

end