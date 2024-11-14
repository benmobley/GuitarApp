class ChordsController < ApplicationController
  def index
    if params[:search]
      @chords = Chord.where("name ILIKE ?", "%#{params[:search]}")
    else
      @chords = Chord.all.order(:name)
    end
    render :index
  end

  def show
    @chord = Chord.find_by(id: params[:id])
    @inversions = @chord.inversions.order(
      Arel.sql("CASE
            WHEN name = 'Root Position' THEN 1
            WHEN name = 'First Inversion' THEN 2
            WHEN name = 'Second Inversion' THEN 3
            ELSE 4
            END")
    )
  end

  def home
    @chord_types = Chord.distinct.pluck(:chord_type)
  end

  def triads
    chords = Chord.where(chord_type: "Triad")
    @string_sets = chords.distinct.pluck(:string_set)
  end

  def by_string_set
    @string_set = params[:string_set]
    @chords = Chord.where(string_set: @string_set, chord_type: "Triad")

    render :index
  end

  def open
    @chords = Chord.where(string_set: "EADGBe", chord_type: "Open")
  end
end
