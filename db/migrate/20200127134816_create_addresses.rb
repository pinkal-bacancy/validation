class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.text :address_line1
      t.text :address_line2
      t.string :city
      t.string :state
      t.string :zipcode
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
