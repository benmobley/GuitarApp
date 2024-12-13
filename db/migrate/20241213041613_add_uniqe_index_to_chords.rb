class AddUniqeIndexToChords < ActiveRecord::Migration[7.2]
  def change
    add_index :chords, [:name, :string_set], unique: true
  end
end
