class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false, default:"insertFirst"
      t.string :last_name, null: false, default:"insertLast"
      #t.string :email

      t.timestamps null: false
    end
  end
end
