class AddAnnounceeSpecificText < ActiveRecord::Migration
  def up
    add_column :announcees, :term_of_address, :string, :default => "Dear"
    add_column :announcees, :announcement_text, :string, :default => "has a new posting for you"
    Announcee.all.each do |announcee|
      announcee.term_of_address = "Dear"
      announcee.announcement_text = "has a new posting for you"
    end
  end

  def down
    remove_column :announcees, :announcement_text
    remove_column :announcees, :term_of_address
  end
end
