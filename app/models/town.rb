class Town < ActiveRecord::Base
include ActiveModel::Validations
  paginates_per 30
  has_many :users
  belongs_to :country
  attr_accessible :accent_city, :city, :country_iso, :country_id, :latitude, :longitude, :region, :city_rus
  validates :country_id, presence: true, numericality: { only_integer: true }
  validates :accent_city, presence: true
  validates :city, presence: true

  def twdata
    "#{accent_city} (#{country_iso}, #{latitude}, #{longitude})"
  end

  def self.search(search)
    if search
      where('country LIKE ? OR city LIKE ? OR accent_city LIKE ? OR region = ?', "%#{search}%", "%#{search}%", "%#{search}%",  "#{search}")
    else
      all
    end
  end
end
