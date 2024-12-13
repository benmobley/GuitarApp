class AddStringSetToChord < ActiveRecord::Migration[7.2]
  def change
    add_column :chords, :string_set, :string
  end
end
