class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.belongs_to :user
      t.belongs_to :room
      t.timestamps

      t.index [:user_id, :room_id], unique: true
    end
  end
end
