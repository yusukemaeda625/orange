class CreateUattributes < ActiveRecord::Migration[5.1]
  def change
    create_table :uattributes do |t|
      t.string :name

      t.timestamps
    end
  end
end
