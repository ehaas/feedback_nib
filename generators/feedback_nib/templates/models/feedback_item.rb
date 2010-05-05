class FeedbackItem < ActiveRecord::Base
  belongs_to :user
  Categories = %w{new_feedback errors_unfixed errors_fixed praise condemnation request}
  
  def self.for_db(name)
    Categories.index(name)
  end
end
