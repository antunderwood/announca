class GroupMembership < ActiveRecord::Base
  attr_accessible :announcee_id, :group_id, :subscribed_to_mailings
  belongs_to :announcee
  belongs_to :group
  before_create :create_mailing_subscription

  private
  def  create_mailing_subscription
    self.subscribed_to_mailings = true
  end
end
