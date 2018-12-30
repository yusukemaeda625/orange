class AddUserToUattribute < ActiveRecord::Migration[5.1]
  def change
    add_reference :uattributes, :user, foreign_key: true
  end
end
