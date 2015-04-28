class AddGeoinfoToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :latitude, :float
    add_column :tasks, :longitude, :float
    add_column :tasks, :location, :string
  end
end
