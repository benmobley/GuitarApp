class RemoveStringSetsFromChords < ActiveRecord::Migration[7.2]
  def change
    remove_column :chords, :string_set, :string
  end
end
