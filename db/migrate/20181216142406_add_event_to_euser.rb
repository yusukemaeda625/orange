class AddEventToEuser < ActiveRecord::Migration[5.1]
  def change
    add_reference :eusers, :event, foreign_key: true
  end
end
