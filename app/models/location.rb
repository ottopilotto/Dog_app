class Location < ActiveRecord::Base
  # attr_accessible :name, :address, :longitude, :latitude
  validates :name, :address, :description, presence: true
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" },
  :default_url => "missing.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
