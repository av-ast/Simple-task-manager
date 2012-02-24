class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.string :state

      t.timestamps
    end
  end
end
