class CreateTaskHistories < ActiveRecord::Migration[8.0]
  def change
    create_table :task_histories do |t|
      t.references :task, null: false, foreign_key: true
      t.references :from_list, null: false, foreign_key: true
      t.references :to_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
