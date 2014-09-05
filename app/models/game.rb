class Game < ActiveRecord::Base
  attr_accessible :name, :rate

  has_and_belongs_to_many :profiles
  has_and_belongs_to_many :likes, :class_name => "Profile", :join_table => "profiles_games_like", :association_foreign_key => "profile_id"
end
