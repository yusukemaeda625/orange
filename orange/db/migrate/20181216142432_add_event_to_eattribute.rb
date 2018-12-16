class AddEventToEattribute < ActiveRecord::Migration[5.1]
  def change
    add_reference :eattributes, :event, foreign_key: true
  end
end
