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
    Walker.at(@x, @y).each do |walker|
      walker.destroy!
    end
  end

end