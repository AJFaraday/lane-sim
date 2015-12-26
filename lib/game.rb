class Game < Gosu::Window

  attr_accessor :drawable_objects, :updatable_objects
  attr_accessor :grid, :config, :frame, :obstacles

  def initialize(filename='basic.yml')
    @config = Config.new(filename)
    @frame = 0
    @drawable_objects = []
    @updatable_objects = []
    @obstacles = []
    init_field

    super(@init_height, @init_width, {})

    init_grid
    init_walkers
    init_features
    self.caption = "Lane Simulator"
  end

  def update
    updatable_objects.each { |ob| ob.update }
    @frame += 1
  end

  def draw
    drawable_objects.each { |ob| ob.draw }
  end

  def init_field
    @init_height = @config['lane_width'] * @config['no_lanes']
    @init_width = @config['step_size'] * @config['no_steps']
  end

  def init_grid
    @grid = Grid.new(self)
  end

  def init_walkers
    @config['no_walkers'].times do
      Walker.new(self)
    end
  end

  def init_features
    @config['features'].each do |kls, count|
      kls = Kernel.const_get(kls)
      count.times do
        kls.new(self)
      end
    end
  end


  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

end

