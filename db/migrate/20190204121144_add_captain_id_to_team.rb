class AddCaptainIdToTeam < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :caption_id, :integer
  end
end
