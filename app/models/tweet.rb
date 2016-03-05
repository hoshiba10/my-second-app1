class Tweet < ActiveRecord::Base
  belongs_to :person
  validates :person_id, presence: true
  validates :content, presence: true, length: {
      maximum: 140
  }
end
