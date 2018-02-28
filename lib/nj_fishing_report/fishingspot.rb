class FishingSpot::Spot

  attr_accessor :name, :url
  def self.today
    # I should return a bunch of instsances of Deal
    # puts <<-DOC.gsub /^\s*/, ''
    #   1. Belmar
    #   2. Brielle
    # DOC
    location_1 = self.new
    location_1.name = "Belmar"
    location_1.url = "http://www.fishingreportsnow.com/New_Jersey_Fishing_Reports_Pro.cfm/reg/7"

    location_2 = self.new
    location_2.name = "Brielle"
    location_2.url = "http://www.fishingreportsnow.com/New_Jersey_Fishing_Reports_Pro.cfm/reg/7"

    [location_1, location_2]
  end

end
