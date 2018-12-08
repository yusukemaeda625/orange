class AddLAttributeToSAttribute < ActiveRecord::Migration[5.1]
  def change
    add_reference :s_attributes, :L_attribute, foreign_key: true
  end
end
