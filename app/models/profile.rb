class Profile < ActiveRecord::Base
  attr_accessible :bio, :birthday, :name, :user_id

  belongs_to :user
  has_and_belongs_to_many :games
end
