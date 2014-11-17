class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.belongs_to :user, index: true
      t.belongs_to :room, index: true
      t.timestamps

      t.index [:user_id, :room_id], unique: true
    end
  end
end
