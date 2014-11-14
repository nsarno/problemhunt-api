class CreateUpvotes < ActiveRecord::Migration
  def change
    create_join_table :problems, :users, table_name: :upvotes do |t|
      t.index [:problem_id, :user_id], unique: true
    end
  end
end
