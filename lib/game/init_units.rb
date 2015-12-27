module InitUnits

  def init_walkers
    init_declared_walkers
    init_random_walkers
  end

  def init_declared_walkers
    if @config['walkers']
      @config['walkers'].each do |attrs|
        Walker.new(self, attrs['x'], attrs['y'], attrs['step_time'])
      end
    end
  end

  def init_random_walkers
    @config['random_walkers'].times do
      Walker.new(self)
    end
  end

  def init_player
    if @config['playable']
      if config['player']
        Player.new(
          self,
          config['player']['x'],
          config['player']['y']
        )
      else
        Player.new(self)
      end
    end
  end

  def init_features
    init_declared_features
    init_random_features
  end

  def init_declared_features
    if @config['features']
      @config['features'].each do |kls, instances|
        kls = Kernel.const_get(kls)
        if kls == Portal
          instances.each do |attrs|
            init_portal(attrs)
          end
        else
          instances.each do |attrs|
            kls.new(self, attrs['x'], attrs['y'])
          end
        end
      end
    end
  end

  def init_portal(attrs)
    portal = Portal.new(self, attrs['x'], attrs['y'])
    counterpart = portal.counterpart
    counterpart.x = attrs['counterpart']['x']
    counterpart.y = attrs['counterpart']['y']
    counterpart.set_angle_to_counterpart
    portal.set_angle_to_counterpart
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