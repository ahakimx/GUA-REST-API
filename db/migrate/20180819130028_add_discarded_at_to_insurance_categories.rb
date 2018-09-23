class AddDiscardedAtToInsuranceCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :insurance_categories, :discarded_at, :datetime
    add_index :insurance_categories, :discarded_at
  end
end
