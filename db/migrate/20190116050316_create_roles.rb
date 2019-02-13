class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name
      t.boolean :active
      t.integer :counter

      t.timestamps
    end
  end
end
