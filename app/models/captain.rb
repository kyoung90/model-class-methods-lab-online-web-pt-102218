class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    self.all.select do |captain| 
      boat_is_catamaran = false
      captain.boats.each do |boat|
        if boat.classifications.exists?(name: "Catamaran")
          boat_is_catamaran = true
        end 
      end 
      boat_is_catamaran
    end 
  end

  def self.sailors
    self.all.select do |captain| 
      boat_is_catamaran = false
      captain.boats.each do |boat|
        if boat.classifications.exists?(name: "Sailboat")
          boat_is_catamaran = true
        end 
      end 
      boat_is_catamaran
    end 
  end

  def self.talented_seafarers
    self.all.select do |captain| 
      boat_is_sailboat = false
      boat_is_motorboat = false
      captain.boats.each do |boat|
        if boat.classifications.exists?(name: "Sailboat") 
          boat_is_sailboat = true
        end 
        if boat.classifications.exists?(name: "Motorboat")
          boat_is_motorboat = true
        end
      end 
      boat_is_sailboat && boat_is_motorboat
    end 
  end

  def self.non_sailors
    self.all.select do |captain| 
      boats_are_sailboats = false
      captain.boats.each do |boat|
        if boat.classifications.exists?(name: "Sailboat")
          boats_are_sailboats = true
        end 
      end 
      !boats_are_sailboats
    end 
  end

end
