class CreateUSAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :u_s_attributes do |t|
      t.string :name

      t.timestamps
    end
  end
end
