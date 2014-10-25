class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :description
      t.references :organization, index: true

      t.timestamps
    end
  end
end
