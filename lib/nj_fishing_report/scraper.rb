
class NjFishingReport::Scraper

  def self.scrape_fishing_location_and_report
    doc =
    Nokogiri::HTML(open('http://www.fishingreportsnow.com/New_Jersey_Fishing_Reports_Pro.cfm/reg/7'))

    fishing_locations = []

    doc.css("td.reportstext a").each do |potential_location|
      if potential_location.attribute("href").value[0,30] == "New_Jersey_Fishing_Reports_Pro" && potential_location.text != "Last Week's Report"
        fishing_locations << potential_location
      end
    end

    fishing_locations.each do |location|
      NjFishingReport::Fishing_Location.new(location.text, NjFishingReport::Fishing_Report.new("http://www.fishingreportsnow.com/" + location.attribute("href").value))
    end
  end

  def self.scrape_fishing_report
    
  end


end
