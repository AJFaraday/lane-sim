class Walker

  IMAGE = Gosu::Image.new(
    File.join(
      File.dirname(__FILE__),
      '..', 'images',
      'walker.png'
    )
  )

  attr_accessor :x, :y

  def initialize(game,x=0,y=0)
    @x = x
    @y = y
    @game = game
    @game.drawable_objects << self
    @game.updatable_objects << self

    init_step_time
  end

  def config
    @game.config
  end

  # step_time is the number of frames it takes to take 1 step
  def init_step_time
    @step_time = (rand(10)* 10)
    @step_time += 10
    puts "New walker, step_time: #{@step_time}"
  end

  def draw
    IMAGE.draw(
      actual_x,
      actual_y,
      0
    )
  end

  def update
    if moving_frame?
      @y -= 1
      loop_back if @y < 0
    end
  end

  def loop_back
    @y = (config['no_steps'] - 1)
  end

  def moving_frame?
    (@game.frame % @step_time) == 0
  end

  def actual_x
    @x * config['step_size']
  end
  
  def actual_y
    @y * config['step_size']
  end
  
end