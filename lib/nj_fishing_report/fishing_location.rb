

class NjFishingReport::Fishing_Location

  attr_accessor :name, :fishing_report, :tide_chart
  @@all = []

  def initialize(name, fishing_report)
    @name = name
    @fishing_report = fishing_report
    fishing_report.fishing_location = name
    @@all << self
  end

  def self.all
    @@all
  end


  def self.clear
    @@all.clear
  end
end
