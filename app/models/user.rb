class User < ActiveRecord::Base
    has_many :stories, :dependent => :destroy
    has_many :comments, :dependent => :destroy
    
    attr_accessible :email, :name, :role, :password, :password_confirmation
    has_secure_password

    validates :name, :role, :presence => true
    validates_presence_of :password, :on => :create
    validates :email, :presence => true, :uniqueness => true, :email_format => true

    def roles
        [:admin, :editor, :operator]
    end
end

