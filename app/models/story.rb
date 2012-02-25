class Story < ActiveRecord::Base
    belongs_to :user

    validates :user_id, :title, :content, :state, :presence => true
    validates :title, :length => { :maximum => 255 }
    
    state_machine :initial => :new do
        state :new
        state :started
        state :finished
        state :accepted
        state :rejected

        event :started do
            transition :from => :new, :to => :started
        end

        event :finished do
            transition :from => :started, :to => :finished
        end

        event :accepted do
            transition :from => :finished, :to => :accepted
        end

        event :rejected do
            transition :from => :finished, :to => :rejected
        end

        event :started do
            transition :from => :rejected, :to => :started
        end
    end
end
