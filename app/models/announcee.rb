class Announcee < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :group_ids, :group_memberships_attributes
  has_many :groups, :through => :group_memberships
  has_many :group_memberships
  accepts_nested_attributes_for :group_memberships, reject_if: lambda { |group_membership_params| group_membership_params[:group_id] == 0 }, :allow_destroy => true
  before_create :create_token
  
  def self.mail_recipients_for_post(post)
    group_ids = post.groups.map{|group| group.id}
    joins(:group_memberships).where("group_memberships.group_id in (?) AND subscribed_to_mailings = ?", group_ids, true).uniq
  end

  def full_name
    "#{first_name} #{last_name}"
  end
  
  def belongs_to_group?(group_name)
    groups.any? { |group| group.name == group_name }
  end
  
  def setup_group_memberships
    Group.all.each do |group|
      next if group.name == "public"
      group_memberships.build(:group_id => group.id, :subscribed_to_mailings => true) unless belongs_to_group?(group.name)
    end
    group_memberships.sort!{|x,y| x.group.name <=> y.group.name}
  end
  
  private
  def  create_token
    self.token = SecureRandom.hex
  end
end
