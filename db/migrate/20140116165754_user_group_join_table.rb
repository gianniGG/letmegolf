class UserGroupJoinTable < ActiveRecord::Migration
  def change
    create_table :group_admins, id: false do |t|
      t.integer :user_id
      t.integer :group_id
    end
  end
end
