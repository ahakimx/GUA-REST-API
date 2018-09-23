class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :phone_number
      t.text :address
      t.string :birth_place
      t.date :birth_date
      t.string :email

      t.timestamps
    end
  end
end
