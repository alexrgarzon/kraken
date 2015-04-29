class AddColumnsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :category_id, :string
  end
end
