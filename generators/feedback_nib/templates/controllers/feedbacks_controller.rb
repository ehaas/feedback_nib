class FeedbacksController < ApplicationController
  before_filter :require_user
  def index
    if !current_user.admin?
      redirect_to root_path and return
    end
    if params[:category].blank?
      redirect_to feedbacks_path(:category => FeedbackItem::Categories.first)
    end
    @feedback = FeedbackItem.paginate :include => :user, :page => params[:page], :order => 'updated_at DESC', :conditions => {:category => FeedbackItem::Categories.index(params[:category])}
  end
  
  def create
    if params[:message].present?
      f = FeedbackItem.new(:message => params[:message], :emailed => false, :category => 0)
      current_user.feedback_items << f
    end
    head :ok
  end
  
  def update
    head :ok
  end
end