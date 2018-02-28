class NjFishingReport::Scraper

  def self.scrape_fishing_locations(location_url)
    html = File.read("http://www.fishingreportsnow.com/New_Jersey_Fishing_Reports_Pro.cfm/reg/7")
    fishing_locations = Nokogiri::HTML(html)

    

  end

  def self.scrape_fishing_report()

end
