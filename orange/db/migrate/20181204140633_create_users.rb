class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :schoolname
      t.integer :guraduate

      t.timestamps
    end
  end
end
