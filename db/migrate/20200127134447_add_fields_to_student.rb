class AddFieldsToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :terms_and_conditions, :boolean
    add_column :students, :is_checked, :boolean
  end
end
