class Announcee < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :group_ids
  has_many :groups, :through => :group_memberships
  has_many :group_memberships
  accepts_nested_attributes_for :groups, :allow_destroy => true
  before_create :create_token
  
  def self.mail_recipients_for_post(post)
    group_ids = post.groups.map{|group| group.id}
    joins(:group_memberships).where("group_memberships.group_id in (?) AND subscribed_to_mailings = ?", group_ids, true).uniq
  end

  def full_name
    "#{first_name} #{last_name}"
  end
  
  private
  def  create_token
    self.token = SecureRandom.hex
  end
end
