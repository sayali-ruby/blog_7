class AddColumnPhoneNumberToCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :phone, :string
  end
end
