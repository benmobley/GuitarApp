Rails.application.routes.draw do
  root "chords#choose_string_set"

  get "/chords" => "chords#index", as: :chords
  get "/chords/:id" => "chords#show", as: :chord
  get "/string_sets/:string_set", to: "chords#by_string_set", as: :string_set
end
