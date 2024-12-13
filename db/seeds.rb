require "csv"

# Path to your corrected CSV file
csv_file_path = Rails.root.join("db", "chords.csv")

# Read and parse the CSV file
CSV.foreach(csv_file_path, headers: true, col_sep: ",", quote_char: '"') do |row|
  chord_name = row["Chord Name"]
  chord_type = row["Chord Type"]
  string_set = row["String Set"]
  inversion_name = row["Inversion Name"]
  finger_positions_raw = row["Finger Positions"]
  intervals = row["Intervals"]

  # Sanitize and parse the finger positions
  finger_positions = finger_positions_raw.gsub(/[\[\]\s]/, "").split(",").map do |pos|
    pos.upcase == "X" ? -1 : pos.to_i # Convert 'X' to -1 for muted strings
  end

  # Ensure the finger_positions array has 6 elements
  if finger_positions.size != 6
    puts "Warning: Chord #{chord_name} has #{finger_positions.size} finger positions."
    next # Skip this chord or handle the error as appropriate
  end

  # Find or create the chord using both `name` and `string_set` for uniqueness
  chord = Chord.find_or_create_by!(
    name: chord_name,
    chord_type: chord_type,
    string_set: string_set, # Now considers `string_set` as part of the unique identification
  )

  # Create the inversion for the chord
  chord.inversions.create!(
    name: inversion_name,
    finger_positions: finger_positions, # Assuming finger_positions is stored as an array
    intervals: intervals,
  )
end
