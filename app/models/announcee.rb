class Announcee < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :group_ids
  has_many :groups, :through => :group_memberships
  has_many :group_memberships
  accepts_nested_attributes_for :groups, :allow_destroy => true
  before_create :create_token

  private
  def  create_token
    self.token = SecureRandom.hex
  end
end
