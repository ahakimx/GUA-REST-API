class CreateInsuranceCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :insurance_categories do |t|
      t.string :name
      t.string :slug
      
      t.timestamps
    end
  end
end
