class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.belongs_to :problem
      t.belongs_to :user
      t.timestamps

      t.index [:problem_id, :user_id], unique: true
    end
  end
end
