class CreateAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :attributes do |t|
      t.string :lagaercategory
      t.string :smallercategory

      t.timestamps
    end
  end
end
