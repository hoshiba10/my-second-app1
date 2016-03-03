class Person < ActiveRecord::Base
    before_save {
        self.email = email.downcase
    }
    
    validates :name, presence: true, length: {
        maximum: 50
    }
    
    validates :sex, presence: true
    
    VALID_EMAIL_REGREX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :email, presence: true, length: {
        maximum: 255
    },
    format: {
        with: VALID_EMAIL_REGREX
    },
    uniqueness: {
        case_sensitive: false
    }
    
    has_secure_password
end
