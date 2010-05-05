class FeedbackNib
  module Controller
    module Feedback

      ActionController::Base.view_paths.unshift File.join(File.dirname(__FILE__), "../views")
      
      def index
        if !current_user.admin?
          redirect_to root_path and return
        end
        if params[:category].blank?
          redirect_to feedbacks_filter_path(Feedback::Categories.first)
        end
        @feedback = Feedback.paginate :include => :user, :page => params[:page], :order => 'updated_at DESC', :conditions => {:category => Feedback::Categories.index(params[:category])}
      end
      
      def create
        if params[:message].present?
          f = Feedback.new(:message => params[:message], :emailed => false, :category => 0)
          current_user.feedbacks << f
        end
        head :ok
      end
      
    end
  end
end