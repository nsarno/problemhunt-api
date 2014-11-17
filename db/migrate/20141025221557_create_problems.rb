class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :description
      t.belongs_to :room, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
