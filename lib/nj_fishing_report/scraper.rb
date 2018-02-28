
class NjFishingReport::Scraper

  def self.scrape_fishing_locations
    doc =
    Nokogiri::HTML(open('http://www.fishingreportsnow.com/New_Jersey_Fishing_Reports_Pro.cfm/reg/7'))

    fishing_locations = []
    doc.css("td.reportstext a").each do |potential_location|
      if potential_location.attribute("href").value[0,30] == "New_Jersey_Fishing_Reports_Pro" && potential_location.text != "Last Week's Report"
        fishing_locations << potential_location
      end
    end

    fishing_locations.each do |location|
      NjFishingReport::FishingSpot.new(location.text)
    end
  end

binding.pry
  def self.scrape_fishing_report
  end

end
