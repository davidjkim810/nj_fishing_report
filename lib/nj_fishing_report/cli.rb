# Our CLI Controller (Model View Controller)
class NjFishingReport::CLI

  def call
    NjFishingReport::Scraper.scrape_fishing_location_and_report
    list_fishing_locations

  end

  def list_fishing_locations
    NjFishingReport::Fishing_Location.all.each_with_index do |location, index|
      puts "#{index + 1}. #{location.name}"
    end
  end

  def goodbye
    puts "Come back again to see more fishing reports!"
  end
end
