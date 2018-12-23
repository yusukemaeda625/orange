class AddEventToEvowner < ActiveRecord::Migration[5.1]
  def change
    add_reference :evowners, :event, foreign_key: true
  end
end
