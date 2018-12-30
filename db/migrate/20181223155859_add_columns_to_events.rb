class AddColumnsToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :ownerid, :integer
    add_column :events, :place, :string
    add_column :events, :fee, :string
  end
end
