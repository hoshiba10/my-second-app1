class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: "Person"
  belongs_to :followed, class_name: "Person"
end
