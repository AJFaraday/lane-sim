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
    if @map_index.nil?
      @map_index = 0
    else
      @map_index += 1
    end
    if @config['maps']
      if map_defined?
        play_level
        next_map if PROGRESSING_STATUSES.include?(@game.status)
      elsif @map_index == 0
        play_level
      end
    else
      play_level
    end
  end

  def play_level
    puts "Starting level #{@map_index + 1}"
    @game = Game.new(@config, @map_index)
    @game.show
  end

  #
  # If there's a list of maps, check the next one is there.
  #
  def map_defined?
    map_name = @config['maps'][@map_index]
    path = File.join(
      File.dirname(__FILE__),
      '..',
      'maps',
      "#{map_name}.txt"
    )
    File.exists?(path)
  end

end