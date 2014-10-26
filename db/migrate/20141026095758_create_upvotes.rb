class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.references :problem, index: true
      t.references :user, index: true

      t.timestamps
    end

    add_index :upvotes, [:problem_id, :user_id], unique: true
  end
end
