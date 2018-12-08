class AddULAttributeToUSAttribute < ActiveRecord::Migration[5.1]
  def change
    add_reference :u_s_attributes, :U_l_attribute, foreign_key: true
  end
end
