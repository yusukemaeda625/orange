class AddUserToULAttribute < ActiveRecord::Migration[5.1]
  def change
    add_reference :u_l_attributes, :User, foreign_key: true
  end
end
