# Our CLI Controller (Model View Controller)

class NjFishingReport::CLI

  def call
    list_fishing_locations
    menu
    goodbye
  end

  def list_fishing_locations
    # here doc
    puts "Which location would you like a fishing report for?"
    # @spots = FishingSpot::Spot.today

  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the location you'd like more information on or type 'list' or type 'exit'"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on location 1"
      when "2"
        puts "more info on location 2"
      when "list"
        list_fishing_locations
      else
        puts "Not sure what you want, type list or exit."
      end
    end
  end

  def goodbye
    puts "Come back again to see more fishing reports!"
  end
end
