class UsersAndInterestGroupJoinTable < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :user_id, null: false
      t.integer :interest_group_id, null: false

      t.timestamps
    end
  end
end
