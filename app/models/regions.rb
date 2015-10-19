class Regions < ActiveRecord::Base
include ActiveModel::Validations
  attr_accessible :area, :capitalcity_id, :country_id, :name_eng, :name_rus, :population
end
