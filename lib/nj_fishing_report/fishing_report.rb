class NjFishingReport::Fishing_Report

  attr_accessor :report, :fishing_location
  @@all = []
  def initialize(report_url)
    doc = Nokogiri::HTML(open(report_url))
    doc.css("td.reportstext").each do |possible_fishing_report|
      if possible_fishing_report.attribute("align").value == "left"
        @report = possible_fishing_report.text.strip
      end
    end
    @@all << self
  end

  def self.all
    @@all
  end

end
