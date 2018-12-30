class CreateEattributes < ActiveRecord::Migration[5.1]
  def change
    create_table :eattributes do |t|
      t.string :name

      t.timestamps
    end
  end
end
