class AddIndexToStories < ActiveRecord::Migration
  def self.up
    change_table :stories do |t|
      t.index :user_id
      t.index :title
      t.index :state
    end
  end

  def self.down
    change_table :widgets do |t|
      t.remove_index :user_id
      t.remove_index :title
      t.remove_index :state
    end
  end
end
