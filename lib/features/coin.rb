class Coin < Feature

  IMAGE = Gosu::Image.new(
    File.join(
      File.dirname(__FILE__),
      '..', '..', 'images',
      'coin.png'
    )
  )

  def class_init
    @game.obstacles << self
  end

  def image
    Coin::IMAGE
  end

  def update
    players = Player.at(@x, @y)
    if players.any?
      players.each do |player|
        player.score_up
      end
      self.teleport
    end
  end

end