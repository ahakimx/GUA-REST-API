class AddImageToPromo < ActiveRecord::Migration[5.2]
  def change
    add_column :promos, :image, :string
  end
end
