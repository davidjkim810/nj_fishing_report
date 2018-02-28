

class NjFishingReport::FishingSpot

  attr_accessor :name, :tide, :weather
  @@all = []
  
  def initialize(name)
    @name = name
  end

end
