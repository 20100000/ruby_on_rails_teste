class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.references :projeto, foreign_key: true
      t.string :status
      t.string :description
      t.integer :points
      t.datetime :finished_at
      t.datetime :deadline

      t.timestamps
    end
  end
end
