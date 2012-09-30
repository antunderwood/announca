class GroupMembershipsController < ApplicationController
  def update
    announcee = Announcee.find_by_token(params[:token])
    group = Group.find_by_name(params[:group_name])
    logger.info group.inspect
    GroupMembership.find_by_announcee_id_and_group_id(announcee.id, group.id).update_attribute(:subscribed_to_mailings, false)
    redirect_to posts_url(:token => announcee.token), notice: "Unsubscribed to mailings from the #{group.name} group"
  end
end
