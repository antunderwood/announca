class GroupMembership < ActiveRecord::Base
  attr_accessible :announcee_id, :group_id, :subscribed_to_mailings
  belongs_to :announcee
  belongs_to :group
end
