class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer

      t.timestamps
    end
  end
end
