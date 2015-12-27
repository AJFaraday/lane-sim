module PlayerScore

  attr_accessor :score

  def score_up
    @score ||= 0
    @score += 1
    @game.log("Player got a coin. Score: #{@score}")
  end

end