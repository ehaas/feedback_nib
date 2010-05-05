class FeedbackNibMigrationGenerator < Rails::Generator::Base
  require 'feedback_nib'
  
  def manifest
    record do |m|
      m.migration_template 'feedback_nib_migration.rb', 'db/migrate', 
        :assigns => {:version => FeedbackNib.MAJOR_VERSION.gsub(".", "")}
    end
  end

  def file_name
    "feedback_nib_migration_#{FeedbackNib.MAJOR_VERSION.gsub(".", "_")}"
  end
end
