class CreateSports < ActiveRecord::Migration[7.0]
  def change
    create_table :sports do |t|
      t.string :name
      t.string :course
      t.string :gender
      t.integer :age

      t.timestamps
    end
  end
end
