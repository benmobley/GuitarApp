# chords_data = [
#   {
#     name: "C Major",
#     chord_type: "Triad",
#     string_set: "ADG",
#     inversions: [
#       {
#         name: "Root Position",
#         finger_positions: "x320xx",
#         intervals: "1 3 5",
#       },
#       {
#         name: "First Inversion",
#         finger_positions: "x755xx",
#         intervals: "3 5 1",
#       },
#       {
#         name: "Second Inversion",
#         finger_positions: "x998xx",
#         intervals: "5 1 3",
#       },
#     ],
#   },
#   {
#     name: "C Minor",
#     chord_type: "Triad",
#     string_set: "ADG",
#     inversions: [
#       {
#         name: "Root Position",
#         finger_positions: "x310xx",
#         intervals: "1 b3 5",
#       },
#       {
#         name: "First Inversion",
#         finger_positions: "x655xx",
#         intervals: "b3 5 1",
#       },
#       {
#         name: "Second Inversion",
#         finger_positions: "x997xx",
#         intervals: "5 1 b3",
#       },
#     ],
#   },
#   {
#     name: "C Diminished",
#     chord_type: "Triad",
#     string_set: "ADG",
#     inversions: [
#       {
#         name: "Root Position",
#         finger_positions: "x31(-1)xx",
#         intervals: "1 b3 b5",
#       },
#       {
#         name: "First Inversion",
#         finger_positions: "x645xx",
#         intervals: "b3 b5 1",
#       },
#       {
#         name: "Second Inversion",
#         finger_positions: "x9(10)8xx",
#         intervals: "b5 1 b3",
#       },
#     ],
#   },
#   {
#     name: "D Major",
#     chord_type: "Triad",
#     string_set: "ADG",
#     inversions: [
#       {
#         name: "Root Position",
#         finger_positions: "x542xx",
#         intervals: "1 3 5",
#       },
#       {
#         name: "First Inversion",
#         finger_positions: "x977xx",
#         intervals: "3 5 1",
#       },
#       {
#         name: "Second Inversion",
#         finger_positions: "x(12)(12)(11)xx",
#         intervals: "5 1 3",
#       },
#     ],
#   },
#   {
#     name: "D Minor",
#     chord_type: "Triad",
#     string_set: "ADG",
#     inversions: [
#       {
#         name: "Root Position",
#         finger_positions: "x532xx",
#         intervals: "1 b3 5",
#       },
#       {
#         name: "First Inversion",
#         finger_positions: "x877xx",
#         intervals: "b3 5 1",
#       },
#       {
#         name: "Second Inversion",
#         finger_positions: "x(12)(12)(10)xx",
#         intervals: "5 1 b3",
#       },
#     ],
#   },
#   {
#     name: "D Diminished",
#     chord_type: "Triad",
#     string_set: "ADG",
#     inversions: [
#       {
#         name: "Root Position",
#         finger_positions: "x531xx",
#         intervals: "1 b3 b5",
#       },
#       {
#         name: "First Inversion",
#         finger_positions: "x867xx",
#         intervals: "b3 b5 1",
#       },
#       {
#         name: "Second Inversion",
#         finger_positions: "x(11)(12)(10)xx",
#         intervals: "b5 1 b3",
#       },
#     ],
#   },
# # Add more chord data here
# ]

# chords_data.each do |chord_data|
#   chord = Chord.create(
#     name: chord_data[:name],
#     chord_type: chord_data[:chord_type],
#     string_set: chord_data[:string_set],
#   )

#   chord_data[:inversions].each do |inversion_data|
#     chord.inversions.create(
#       name: inversion_data[:name],
#       finger_positions: inversion_data[:finger_positions],
#       intervals: inversion_data[:intervals],
#     )
#   end
# end

# db/seeds.rb

require "csv"

# Hash to keep track of created chords, to avoid duplicating them
created_chords = {}

CSV.foreach(Rails.root.join("db/chords.csv"), headers: true) do |row|
  chord_name = row["Chord Name"]
  chord_type = row["Chord Type"]
  string_set = row["String Set"]
  inversion_name = row["Inversion Name"]
  finger_positions = row["Finger Positions"]
  intervals = row["Intervals"]

  # Find or create the chord
  chord = created_chords[chord_name] || Chord.find_or_create_by!(
    name: chord_name,
    chord_type: chord_type,
    string_set: string_set,
  )

  # Store the chord in the hash to avoid duplicate creation
  created_chords[chord_name] ||= chord

  # Create each inversion for the chord
  chord.inversions.create!(
    name: inversion_name,
    finger_positions: finger_positions,
    intervals: intervals,
  )
end
