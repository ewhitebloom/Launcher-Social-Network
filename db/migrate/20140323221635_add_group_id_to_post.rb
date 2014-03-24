class AddGroupIdToPost < ActiveRecord::Migration
  def up
    add_column :posts, :interest_group_id, :integer, null: false
  end

  def down
    remove_column :posts, :interest_group_id
  end
end
