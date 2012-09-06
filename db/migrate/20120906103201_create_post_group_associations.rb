class CreatePostGroupAssociations < ActiveRecord::Migration
  def change
    create_table :post_group_associations do |t|
      t.integer :post_id
      t.integer :group_id

      t.timestamps
    end
  end
end
