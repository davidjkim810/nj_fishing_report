
class NjFishingReport::Fishing_Location

  attr_accessor :name, :fishing_report, :url
  @@all = []

  def initialize(name, fishing_report)
    @name = name
    @fishing_report = fishing_report
    fishing_report.report_location = name
    @@all << self
  end

  def self.all
    @@all
  end

end
