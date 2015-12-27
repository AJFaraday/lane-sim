class Map

  def initialize(game, file_name)
    @game = game
    @file_name = file_name
    init_units
  end

  def init_units
    lines = map_file.read.split("\n")
    @game.no_lanes = lines[0].index('|')
    @game.no_steps = lines.count

    lines.each_with_index do |line, y|
      line[0..@game.no_lanes].chars.each_with_index do |char, x|
        kls = Map.key[char]
        if kls.is_a?(Array)
          #TODO
        elsif kls
          kls.new(@game, x, y)
        end
      end
    end
  end

  def map_file
    File.open(
      File.join(
        File.dirname(__FILE__),
        '..',
        'maps',
        "#{@file_name}.txt"
      )
    )
  end

  def self.key
    return @@key if defined?(@@key)
    @@key = {
      'p' => Player,
      'w' => Walker,
      'b' => Blocker,
      'x' => Exit,
      'n' => Entrance,
      'c' => Coin,
      'o' => Portal
    }
    (0..9).to_a.each do |num|
      @@key[num.to_s] = [Portal, num.to_i]
    end
    @@key
  end

end