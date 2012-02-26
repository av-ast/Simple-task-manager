class AddIndexToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.index :email, :unique => true
      t.index :name
      t.index :role
    end
  end

  def self.down
    change_table :widgets do |t|
      t.remove_index :email
      t.remove_index :name
      t.remove_index :role
    end
  end
end
