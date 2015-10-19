class TownPolicy < ApplicationPolicy
  def admin_tw?
    admin
  end

  def tw_dist?
    readers
  end

  def autocomplete_town_accent_city?
    readers
  end
end
