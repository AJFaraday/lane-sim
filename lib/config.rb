class Config

  attr_accessor :data

  def initialize(filename='1-lane.yml')
    file_path = File.join(File.dirname(__FILE__), '..', 'config', filename)
    @data = YAML.load_file(file_path)
  end

  def [] (attr)
    @data[attr]
  end

  def []= (attr, val)
    @data[attr] = val
  end

end