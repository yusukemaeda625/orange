class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :content
      t.datetime :date
      t.integer :number
      t.string :schoolname

      t.timestamps
    end
  end
end
