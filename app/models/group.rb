class Group < ActiveRecord::Base
  attr_accessible :name
  has_many :posts, :through => :post_group_associations
  has_many :post_group_associations
  has_many :announcees, :through => :group_memberships
  has_many :group_memberships
end
