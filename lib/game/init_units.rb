module InitUnits

  def init_walkers
    @config['random_walkers'].times do
      Walker.new(self)
    end
  end

  def init_player
    if @config['playable']
      Player.new(self)
    end
  end

  def init_features
    init_declared_features
    init_random_features
  end

  def init_declared_features
    @config['features'].each do |kls, instances|
      kls = Kernel.const_get(kls)
      if kls == Portal
        instances.each do |attrs|
          portal = Portal.new(self, attrs['x'], attrs['y'])
          counterpart = portal.counterpart
          counterpart.x = attrs['counterpart']['x']
          counterpart.y = attrs['counterpart']['y']
          counterpart.set_angle_to_counterpart
          portal.set_angle_to_counterpart
        end
      else
        instances.each do |attrs|
          kls.new(self, attrs['x'], attrs['y'])
        end
      end
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