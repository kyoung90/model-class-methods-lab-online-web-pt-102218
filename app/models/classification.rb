class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    self.all.uniq {|classification| classification.name}
  end 

  def self.longest
    longest = 0
    classifications = nil
    self.all.each do |classification|
      classification.boats.each do |boat|
        if longest < boat.length
          longest = boat.length
          classifications = boat.classifications
        end 
      end 
    end 
    classifications
  end 
end
