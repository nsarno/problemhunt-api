class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.belongs_to :problem, index: true
      t.belongs_to :user, index: true
      t.timestamps

      t.index [:problem_id, :user_id], unique: true
    end
  end
end
