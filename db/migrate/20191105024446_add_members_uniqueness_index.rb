class AddMembersUniquenessIndex < ActiveRecord::Migration[5.0]
  def change
    def self.up
    	add_index :group_members, [:group_id, :user_id], :unique => true
    end

    def self.down
   	  remove_index :group_members, [:group_id, :user_id]
    end
  end
end
