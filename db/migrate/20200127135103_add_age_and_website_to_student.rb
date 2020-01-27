class AddAgeAndWebsiteToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :age, :integer
    add_column :students, :website, :string
  end
end
