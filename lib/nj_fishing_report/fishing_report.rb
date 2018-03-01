class NjFishingReport::Fishing_Report

  attr_accessor :report, :fishing_location
  @@all = []

  def initialize(report)
    @report = report
    @@all << self
  end

  def self.all
    @@all
  end

end
