class FeedbackNibMigrationGenerator < Rails::Generator::Base
  require 'feedback_nib'
  
  def manifest
    record do |m|
      m.migration_template 'migrate/feedback_nib_migration.rb', 'db/migrate'

      m.file 'models/feedback_item.rb', 'app/models/feedback_item.rb'

      m.directory 'app/views/feedback'
      m.file 'views/feedback/_feedback_nib.html.haml', 'app/views/feedback/_feedback_nib.html.haml'
      m.file 'views/feedback/index.html.haml', 'app/views/feedback/_feedback_nib.html.haml'
      
    end
  end

  def file_name
    "feedback_nib_migration_#{FeedbackNib.MAJOR_VERSION.gsub(".", "_")}"
  end
end
