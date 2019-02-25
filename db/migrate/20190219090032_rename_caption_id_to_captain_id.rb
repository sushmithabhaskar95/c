class RenameCaptionIdToCaptainId < ActiveRecord::Migration[5.2]
  def change
    rename_column :teams, :caption_id, :captain_id,references: :user
  end
end
