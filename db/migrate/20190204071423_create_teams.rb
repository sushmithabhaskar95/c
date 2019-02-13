class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :team_id
      t.string :team_name
      t.string :ground_name
      t.timestamps
    end
  end
end
