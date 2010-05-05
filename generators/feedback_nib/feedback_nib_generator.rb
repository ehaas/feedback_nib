class FeedbackNibGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.migration_template 'migrate/feedback_nib.rb', 'db/migrate'

      m.file 'models/feedback_item.rb', 'app/models/feedback_item.rb'

      m.directory 'app/views/feedback'
      m.file 'views/feedback/_feedback_nib.html.haml', 'app/views/feedback/_feedback_nib.html.haml'
      m.file 'views/feedback/index.html.haml', 'app/views/feedback/_feedback_nib.html.haml'
      
      m.file 'javascripts/feedback.js', 'public/javascripts/feedback.js'
      m.file 'stylesheets/sass/feedback_nib.sass', 'public/stylesheets/sass/feedback_nib.sass'
    end
  end

  def file_name
    "feedback_nib"
  end
end
