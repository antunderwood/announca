class CreateGroupMemberships < ActiveRecord::Migration
  def change
    create_table :group_memberships do |t|
      t.integer :announcee_id
      t.integer :group_id
      t.boolean :subscribed_to_mailings

      t.timestamps
    end
  end
end
