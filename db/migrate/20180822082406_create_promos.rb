class CreatePromos < ActiveRecord::Migration[5.2]
  def change
    create_table :promos do |t|
      t.belongs_to :admin, index: true
      t.string :title
      t.string :slug
      t.text :content
      t.date :due_date
      t.timestamps
    end
  end
end
