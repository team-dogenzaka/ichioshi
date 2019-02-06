class NotificationsController < ApplicationController
  def link_through
    @notification = Notification.find(params[:id])
    @notification.update read: true
    if @notification.notified_type == 'フォロー'
      redirect_to user_path @notification.notified_by_id
    else
     redirect_to review_path @notification.review
    end
  end
end
