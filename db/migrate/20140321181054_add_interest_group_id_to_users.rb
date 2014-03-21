class AddInterestGroupIdToUsers < ActiveRecord::Migration
  def up
    add_column :users, :interest_group_id, :integer
  end

  def down
    remove_column :users, :interest_group_id
  end
end
