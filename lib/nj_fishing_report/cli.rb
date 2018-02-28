# Our CLI Controller (Model View Controller)
puts "Njfishingreport::CLI loaded"

class NjFishingReport::CLI

  def call
    list_fishing_locations
  end

  def list_fishing_locations
    puts "Which location would you like a fishing report for?"

  end

  def goodbye
    puts "Come back again to see more fishing reports!"
  end
end

puts "Njfishingreport::CLI loaded2"
