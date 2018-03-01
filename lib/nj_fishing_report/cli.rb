# Our CLI Controller (Model View Controller)
class NjFishingReport::CLI

  def call
    puts " "
    puts " "
    puts "Welcome to the New Jersey Fishing Report"
    puts " "
    puts " "
    puts "Loading...."
    puts " "
    puts " "
    create_fishing_location_and_report
    greeting
  end

  def greeting
    loop do
      puts "-----------------------------------------"
      puts " "
      puts "To see a list of the hottest fishing spots in NJ, enter 'list'"
      puts " "
      puts "-----------------------------------------"
      puts " "
      puts "To quit, type 'exit'"
      puts " "
      puts "-----------------------------------------"
      puts " "
      puts "What would you like to do?"
      puts " "
      input = gets.strip
      puts " "
      puts " "

      if input == 'exit'
        break
      elsif input == 'list'
        list_fishing_locations
        fishing_report
      end
    end
  end

  def create_fishing_location_and_report
    NjFishingReport::Scraper.scrape_fishing_location_and_report
  end


  def list_fishing_locations
    puts "-----------------------------------------"
    puts "**List of the Hottest Fishing Locations in NJ**"
    puts " "
    NjFishingReport::Fishing_Location.all.each_with_index do |location, index|
      puts "#{index + 1}. #{location.name}"
    end
  end

  def fishing_report
    puts " "
    puts "Please input the number of the location for a fishing report, or type 'exit'"
    puts " "
    input = gets.strip
    loop do
      if input == "exit"
        break
      elsif input.to_i < 1 || input.to_i > NjFishingReport::Fishing_Location.all.length
        puts "That is not a valid entry. Please input a number between 1 and #{NjFishingReport::Fishing_Location.all.length}, or type 'exit'"
        puts " "
        puts " "
        input = gets.strip
      else
        puts "Fishing Report for #{NjFishingReport::Fishing_Location.all[input.to_i-1].name}:"
        puts NjFishingReport::Fishing_Report.all[input.to_i-1].report
        break
      end
    end
  end

  def goodbye
    puts "Come back again to see more fishing reports!"
  end
end
