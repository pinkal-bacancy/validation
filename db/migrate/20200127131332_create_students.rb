class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :contact_no
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
