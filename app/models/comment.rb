class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :story

    validates :user_id, :story_id, :text, :presence => true
    validates :text, :length => { :maximum => 1000 }
end
