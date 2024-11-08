class CreateChords < ActiveRecord::Migration[7.2]
  def change
    create_table :chords do |t|
      t.string :name
      t.string :chord_type
      t.string :string_set

      t.timestamps
    end
  end
end
