class Records < ActiveRecord::Migration[5.1]
  def change
	drop_table :attributes
	drop_table :l_attributes
	drop_table :s_attributes
	drop_table :u_s_attributes
	drop_table :u_l_attributes
  end
end
