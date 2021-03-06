class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :history, foreign_key: true
      t.string :description
      t.boolean :done

      t.timestamps
    end
  end
end
