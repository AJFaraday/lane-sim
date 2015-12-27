class Exit < Feature

  IMAGE = Gosu::Image.new(
    File.join(
      File.dirname(__FILE__),
      '..', '..', 'images',
      'exit.png'
    )
  )

  def image
    Exit::IMAGE
  end

  def update
    things_here.each do |thing|
      thing.destroy!
    end
  end

end