class CreateAnnouncees < ActiveRecord::Migration
  def change
    create_table :announcees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :token

      t.timestamps
    end
  end
end
