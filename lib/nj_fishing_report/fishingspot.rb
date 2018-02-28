

class NjFishingReport::FishingSpot

  attr_accessor :name, :tide, :weather, :report
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.clear
    @@all.clear
  end
end
