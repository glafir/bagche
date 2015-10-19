class Country < ActiveRecord::Base
include ActiveModel::Validations
paginates_per 30
has_many :towns
has_many :brands
  attr_accessible :country_iata_code, :country_icao_code, :country_name, :country_number

  def self.search(search)
    if search
      where('country_name LIKE ? or country_iata_code LIKE ?', "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
