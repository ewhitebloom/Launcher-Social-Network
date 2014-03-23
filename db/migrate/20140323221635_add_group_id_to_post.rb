class AddGroupIdToPost < ActiveRecord::Migration
  def up
    add_column :posts, :group_id, :integer, null: false
  end

  def down
    remove_column :posts, :group_id
  end
end
