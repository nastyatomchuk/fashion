class AddImagesToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :images, :string, array: true, default: []
  end
end
