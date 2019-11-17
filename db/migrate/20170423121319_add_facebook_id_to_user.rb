class AddFacebookIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :facebook_id, :integer, limit: 8
  end
end
