module PlayerScore

  attr_accessor :score

  def score_up
    @score += 1
    @game.log("Player got a coin.")
  end

end