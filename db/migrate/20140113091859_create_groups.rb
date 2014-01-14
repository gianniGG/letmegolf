class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :groupname
      t.string :leader
      t.string :admins
      t.integer :points

      t.timestamps
    end
  end
end
