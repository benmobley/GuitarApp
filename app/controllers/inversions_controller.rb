class InversionsController < ApplicationController
  def show
    @chord = Chord.find(params[:chord_id])
    @inversion = @chord.inversions.find(params[:id])
  end
end
