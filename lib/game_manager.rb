class GameManager

  WIN = 'win'
  LOSE = 'lose'
  QUIT = 'quit'
  SKIP = 'skip'

  PROGRESSING_STATUSES = [WIN, SKIP]

  def initialize(filename='basic.yml')
    @config = Config.new(filename)
    next_map
  end

  def next_map
    if @level_index.nil?
      @level_index = 0
    else
      @level_index += 1
    end
    if @config['levels']
      if map_defined?
        play_level
        next_map if PROGRESSING_STATUSES.include?(@game.status)
      elsif @level_index == 0
        play_level
      else
        puts "You won it all! Contratulations!"
      end
    else
      play_level
    end
  end

  def play_level
    puts "Starting level #{@level_index + 1}"
    @game = Game.new(@config, @level_index)
    @game.show
  end

  #
  # If there's a list of maps, cmap_nameheck the next one is there.
  #
  def map_defined?
    level = @config['levels'][@level_index]
    if level
      map_name = level['map']
      path = File.join(
        File.dirname(__FILE__),
        '..',
        'maps',
        "#{map_name}.txt"
      )
      File.exists?(path)
    else
      false
    end
  end

end