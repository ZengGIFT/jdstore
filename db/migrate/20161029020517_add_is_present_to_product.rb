class AddIsPresentToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :is_present, :boolean, default: false 
  end
end
