# Our CLI Controller (Model View Controller)
class NjFishingReport::CLI

  def call
    greeting
    create_fishing_location_and_report
    run_program_interface
  end

  def greeting
    puts " "
    puts " "
    puts "Welcome to the New Jersey Fishing Report CLI"
    puts " "
    puts " "
    puts "Loading...."
    puts " "
    puts " "
  end

  def run_program_interface
    loop do
      puts "-----------------------------------------"
      puts " "
      puts "For a list of fishing spots, enter 'list'"
      puts " "
      puts "-----------------------------------------"
      puts " "
      puts "To quit, enter 'exit'"
      puts " "
      puts "-----------------------------------------"
      puts " "
      puts "What would you like to do?"
      puts " "
      puts " "
      input = gets.strip
      puts " "
      puts " "

      if input == 'exit'
        goodbye
        break
      elsif input == 'list'
        list_fishing_locations
        fishing_report
      else
        puts "+++++++++++++++++++++++++++"
        puts "+++++++++++++++++++++++++++"
        puts " "
        puts "Please type a valid entry"
        puts " "
        puts "+++++++++++++++++++++++++++"
        puts "+++++++++++++++++++++++++++"
        puts " "
        puts " "
        sleep(3)
      end
    end
  end

  def create_fishing_location_and_report
    NjFishingReport::Scraper.scrape_fishing_location_and_report
  end

  def list_fishing_locations
    puts "-----------------------------------------"
    puts " "
    puts " "
    puts "*Fishing Locations in NJ*"
    puts " "
    puts " "
    NjFishingReport::Fishing_Location.all.each_with_index do |location, index|
      puts "#{index + 1}. #{location.name}"
      puts " "
    end
  end

  def fishing_report
    puts " "
    puts "Please input a number, or enter 'exit' to return to the main menu."
    puts " "
    puts " "
    input = gets.strip
    puts " "
    puts " "
    loop do
      if input == "exit"
        break
      elsif input.to_i < 1 || input.to_i > NjFishingReport::Fishing_Location.all.length
        puts "That is not a valid entry. Please input a number between 1 and #{NjFishingReport::Fishing_Location.all.length}, or type 'exit'"
        puts " "
        puts " "
        input = gets.strip
      else
        puts "********************************"
        puts "Fishing Report for #{NjFishingReport::Fishing_Location.all[input.to_i-1].name}:"
        puts "********************************"
        puts " "
        puts NjFishingReport::Fishing_Report.all[input.to_i-1].report
        puts " "
        sleep(5)
        break
      end
    end
  end

  def goodbye
    puts "-----------------------------------------"
    puts " "
    puts " "
    puts "Happy Fishing!"
    puts " "
    puts "Give a man a fish, and you feed him for a day."
    puts "Teach a man to fish, and you feed him for a lifetime."
    puts "- Unidentified Wise Man"
    puts " "
    puts " "
    puts "-----------------------------------------"
    puts " "
    puts " "
  end
end
