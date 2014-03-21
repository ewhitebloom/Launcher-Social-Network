class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first, null: false
      t.string :last, null: false
      t.string :email, null: false
      t.string :role, null: false
      t.string :fun_fact

      t.timestamps
    end
  end
end
