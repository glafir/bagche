class AddUserIdToAircompany < ActiveRecord::Migration
  def change
    add_column :aircompanies, :user_id, :integer
  end
end
