class AddCaptainNameToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :captain_name, :string
  end
end
