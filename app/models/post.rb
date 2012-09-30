class Post < ActiveRecord::Base
  attr_accessible :body, :title, :group_ids
  has_many :groups, :through => :post_group_associations
  has_many :post_group_associations
  accepts_nested_attributes_for :groups, :allow_destroy => true
  after_create :send_mailing
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
