class CreateJoinTableUserRoom < ActiveRecord::Migration
  def change
    create_join_table :users, :rooms do |t|
      t.index [:user_id, :room_id], unique: true
    end
  end
end
