module InitUnits

  def init_random_units
    init_random_features
    init_random_walkers
  end

  def init_random_walkers
    @config['random_walkers'].times do
      Walker.new(self)
    end
  end

  def init_player
    if @config['playable'] and Player.none?
      Player.new(self)
    end
  end


  def init_random_features
    @config['random_features'].each do |kls, count|
      kls = Kernel.const_get(kls)
      count.times do
        kls.new(self)
      end
    end
  end

end