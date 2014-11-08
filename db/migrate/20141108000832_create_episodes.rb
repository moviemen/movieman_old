class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :name
      t.string :url
      t.integer :last_season
      t.integer :last_episode

      t.timestamps
    end
  end
end
