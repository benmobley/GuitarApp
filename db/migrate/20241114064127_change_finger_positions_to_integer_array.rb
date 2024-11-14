class ChangeFingerPositionsToIntegerArray < ActiveRecord::Migration[7.2]
  def change
    change_column :inversions, :finger_positions, :integer, array: true, default: [], using: "finger_positions::integer[]"
  end
end
