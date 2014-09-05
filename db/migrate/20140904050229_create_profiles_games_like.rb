class CreateProfilesGamesLike < ActiveRecord::Migration
  def up
    create_table :profiles_games_like, :id => false do |t|
      t.references :profile
      t.references :game
    end
  end

  def down
    drop_table :profiles_games_like
  end
end
