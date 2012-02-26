class AddIndexToComments < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|
      t.index :user_id
      t.index :story_id
    end
  end

  def self.down
    change_table :widgets do |t|
      t.remove_index :user_id
      t.remove_index :story_id
    end
  end
end
