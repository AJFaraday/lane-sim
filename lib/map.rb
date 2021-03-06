class Map

  def initialize(game, level)
    @game = game
    @level = level
    @file_name = @level['map']
    init_units
    init_target
  end

  def init_target
    @game.target = @level['target']
  end

  def init_units
    lines = map_file.read.split("\n")
    @game.no_lanes = lines[0].index('|')
    @game.no_steps = lines.count

    lines.each_with_index do |line, y|
      line[0..@game.no_lanes].chars.each_with_index do |char, x|
        kls = Map.key[char]
        if kls.is_a?(Array)
          make_portal(kls, x, y)
        elsif kls
          kls.new(@game, x, y)
        end
      end
    end
  end

  def make_portal(array, x, y)
    if array[0] == Portal
      @portals ||= {}
      @portals[array[1]] ||= []
      portal = Portal.new(@game, x, y)
      if @portals[array[1]].any?
        portal.set_counterpart(@portals[array[1]][0])
        @portals[array[1]] << portal
      else
        @portals[array[1]] << portal
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