class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description
      t.string :title
      t.integer :user_id
      t.string :payment_description
      t.string :category
      t.integer :runner_id

      t.timestamps null: false
    end
  end
end
