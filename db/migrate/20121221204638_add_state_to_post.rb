class AddStateToPost < ActiveRecord::Migration
  def up
  	add_column :posts, :state, :string
  end

  def down
  	remove_column :posts, :state
  end
end
