class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :nickname, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :avatar, :content_type => %w(image/jpeg image/jpg image/png)
  has_many :dogs
  # geocoded_by :ip_address,
  #   :latitude => :lat, :longitude => :lon
  # after_validation :geocode

  def location
    @longitude = longitude
    @latitude = latitude
  end
end
