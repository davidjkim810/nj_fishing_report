
class NjFishingReport::Fishing_Location

  attr_accessor :name, :fishing_report, :url
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.detect {|instance| instance.name == name}
  end

end
