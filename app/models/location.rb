class Location < ActiveRecord::Base
  # attr_accessible :name, :address, :longitude, :latitude
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
