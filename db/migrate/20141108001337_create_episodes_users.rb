class CreateEpisodesUsers < ActiveRecord::Migration
  def change
    create_table :episodes_users do |t|
      t.integer :user_id
      t.integer :episode_id

      t.timestamps
    end
  end
end
