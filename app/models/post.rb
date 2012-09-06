class Post < ActiveRecord::Base
  attr_accessible :body, :title, :group_ids
  has_many :groups, :through => :post_group_associations
  has_many :post_group_associations
  accepts_nested_attributes_for :groups, :allow_destroy => true
end
