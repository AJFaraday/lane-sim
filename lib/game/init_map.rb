module InitMap

  attr_writer :no_lanes, :no_steps

  def no_lanes
    @no_lanes ||= @config['no_lanes']
  end

  def no_steps
    @no_steps ||= @config['no_steps']
  end

  def init_field
    @init_height = Game::LANE_WIDTH * no_lanes
    @init_width = Game::STEP_SIZE * no_steps
  end

  def init_map
    if @config['levels']
      Map.new(self, @config['levels'][@level_index])
    end
    init_field
  end



end