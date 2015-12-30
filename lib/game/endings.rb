module GameEndings

  def close
    Walker.reset!
    Feature.reset!
    Player.reset!
    super
  end

  def win
    @status = GameManager::WIN
    close
  end

  def lose
    @status = GameManager::LOSE
    close
  end

  def quit
    @status = GameManager::QUIT
    close
  end

  def skip
    @status = GameManager::SKIP
    close
  end

end