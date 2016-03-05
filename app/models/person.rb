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
    has_many :following_relationships, class_name: "Relationship",
                                       foreign_key: "follower_id",
                                       dependent: :destroy
                                       
    has_many :following_people, through: :following_relationships, source: :followed
    
    has_many :follower_relationships, class_name: "Relationship",
                                      foreign_key: "followed_id",
                                      dependent:  :destroy
                                      
    has_many :follower_people, through: :follower_relationships, source: :follower
    
    has_secure_password
    
    has_many :tweets
    
    def follow(other_person)
        following_relationships.find_or_create_by(followed_id: other_person.id)
    end
    
    def unfollow(other_person)
        following_relationship = following_relationships.find_by(followed_id: other_person.id)
        following_relationship.destroy if following_relationship
    end
    
    def following?(other_person)
        following_people.include?(other_person)
    end
    
    def timelines
        Tweet.where(person_id: following_person_ids + [self.id])
    end
    
end
