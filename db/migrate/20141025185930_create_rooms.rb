class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :topic
      t.references :owner, null: false, index: true

      t.timestamps
    end

    add_index :rooms, :name, unique: true
  end
end
