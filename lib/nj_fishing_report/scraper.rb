
class NjFishingReport::Scraper

  def self.scrape_fishing_locations(location_url)
    doc =
    Nokogiri::HTML(open('http://www.fishingreportsnow.com/New_Jersey_Fishing_Reports_Pro.cfm/reg/7'))

    fishing_locations = []
    doc.css("td.reportstext a").each do |potential_location|
      if potential_location.attribute("href").value[0,30] == "New_Jersey_Fishing_Reports_Pro"
        fishing_locations << potential_location
      end
    end

    fishing_locations.each do |location|

  end

  def self.scrape_fishing_report()
  end

end
