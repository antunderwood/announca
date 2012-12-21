class Post < ActiveRecord::Base
  include ActiveModel::Transitions
  state_machine do
    state :draft # first one is initial state
    state :published
    state :declined
    
    event :publish do
      transitions :to => :declined, :from => :draft, :on_transition => :send_mailing
    end
  end
  attr_accessible :body, :title, :group_ids
  has_many :groups, :through => :post_group_associations
  has_many :post_group_associations
  accepts_nested_attributes_for :groups, :allow_destroy => true
  default_scope order("created_at DESC")

  def self.public
    joins(:groups).where("groups.name = ?", "public")
  end

  def self.viewable_by_announcee(announcee)
    groups = announcee.groups
    joins(:groups).where("groups.id IN (?) OR groups.name = ?", groups.map{|group| group.id}, "public").uniq
  end
  
  private
  def send_mailing
    email_recipients = Announcee.mail_recipients_for_post(self)
    unless email_recipients.empty?
      email_recipients.each do |email_recipient|
        PostMailer.new_post(self,email_recipient).deliver
      end
    end
  end
end
