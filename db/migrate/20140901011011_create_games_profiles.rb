class CreateGamesProfiles < ActiveRecord::Migration
  def up
    create_table :games_profiles, :id => false do |t|
      t.references :profile
      t.references :game
    end
  end

  def down
    drop_table :games_profiles
  end
end
