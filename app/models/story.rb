class Story < ActiveRecord::Base
    belongs_to :user
    has_many :comments, :dependent => :destroy

    validates_presence_of :user_id, :title, :content, :state, :content
    validates_length_of :title, :maximum => 255
    validates_length_of :content, :maximum => 100
    
    scope :filter, lambda{ |params| { :conditions => params } }

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
