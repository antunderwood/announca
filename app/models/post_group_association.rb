class PostGroupAssociation < ActiveRecord::Base
  attr_accessible :group_id, :post_id
  belongs_to :group
  belongs_to :post
end
