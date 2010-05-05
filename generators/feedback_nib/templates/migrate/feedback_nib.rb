class FeedbackNib < ActiveRecord::Migration
  def self.up
    create_table :feedback_items, :force => true do |t|
      t.belongs_to :user
      t.text :message, :default => '', :null => false
      t.boolean :processed, :default => false, :null => false
      t.integer :category, :default => 0, :null => false
      t.boolean :emailed, :default => false, :null => false
      t.timestamps
    end
    add_index :feedback_items, :user_id
  end

  def self.down
    drop_table :feedback_items
  end
end
