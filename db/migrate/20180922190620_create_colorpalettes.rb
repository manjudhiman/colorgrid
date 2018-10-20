class CreateColorpalettes < ActiveRecord::Migration[5.2]
  def change
    create_table :colorpalettes do |t|
      t.string :code
      t.integer :row
      t.integer :column
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
