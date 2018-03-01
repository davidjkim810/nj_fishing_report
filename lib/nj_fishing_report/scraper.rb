
class NjFishingReport::Scraper

  def self.scrape_fishing_location

    doc = Nokogiri::HTML(open('http://www.fishingreportsnow.com/New_Jersey_Fishing_Reports_Pro.cfm/reg/7'))

    fishing_locations = []

    doc.css("td.reportstext a").each do |potential_location|
      if potential_location.attribute("href").value[0,30] == "New_Jersey_Fishing_Reports_Pro" && potential_location.text != "Last Week's Report"
        fishing_locations << potential_location
      end
    end

    fishing_locations.each do |location|
      fishing_location = location.text
       fishing_location = NjFishingReport::Fishing_Location.new(location.text)
      fishing_location.url = "http://www.fishingreportsnow.com/" + location.attribute("href").value
    end
  end


  def self.scrape_fishing_report

    NjFishingReport::Fishing_Location.all.each do |location|

      doc = Nokogiri::HTML(open(location.url))

      doc.css("td.reportstext").each do |scraping_only_fishing_report|
        if scraping_only_fishing_report.attribute("align").value == "left"

          scraped_fishing_report = NjFishingReport::Fishing_Report.new(scraping_only_fishing_report.text.strip)

          scraped_fishing_report.url = location.url

          scraped_fishing_report.fishing_location = NjFishingReport::Fishing_Location.all.detect {|instance| instance.name == location.name}

          instance_of_fishing_location = NjFishingReport::Fishing_Location.all.detect {|instance| instance.name == location.name}

          instance_of_fishing_location.fishing_report = scraped_fishing_report

        end
      end
    end
  end
end
