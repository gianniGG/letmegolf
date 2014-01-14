class AddMicropostsToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :microposts, :string
  end
end
