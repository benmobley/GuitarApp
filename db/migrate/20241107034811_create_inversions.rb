class CreateInversions < ActiveRecord::Migration[7.2]
  def change
    create_table :inversions do |t|
      t.string :name
      t.string :finger_positions
      t.string :intervals
      t.references :chord, null: false, foreign_key: true

      t.timestamps
    end
  end
end
