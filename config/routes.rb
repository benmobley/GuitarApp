Rails.application.routes.draw do
  root "chords#home"

  get "/chords" => "chords#index", as: :chords
  get "/chords/:id" => "chords#show", as: :chord

  get "/triads/:string_set", to: "chords#by_string_set", as: :string_set
  get "/triads" => "chords#triads", as: :triads

  get "/open", to: "chords#open", as: :open_chords
end
