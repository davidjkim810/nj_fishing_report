class NjFishingReport::Fishing_Report

  attr_accessor :report, :report_location
  @@all = []
  def initialize(report_url)
    doc = Nokogiri::HTML(open(report_url))
    doc.css("td.reportstext").each do |text|
      if text.attribute("align").value == "left"
        @report = text.text.strip
      end
    end
    @@all << self
  end

  def self.all
    @@all
  end

end
