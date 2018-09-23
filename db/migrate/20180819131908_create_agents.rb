class CreateAgents < ActiveRecord::Migration[5.2]
  def change
    create_table :agents do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.string :avatar
      t.text :address
      t.integer :gender
      t.string :birth_place
      t.date :birth_date
      t.integer :change_request_count
      t.timestamps
    end
  end
end
