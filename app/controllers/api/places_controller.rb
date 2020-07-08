class Api::PlacesController < ApplicationController

  def index
    @places = Place.all
    render "index.json.jb"
  end

  def create
    @place = Place.new(
      name: params[:name],
      address: params[:address]
    )
    if @place.save
      render "show.json.jb"
    else
      render json: { errors: @place.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @place = Place.find(params[:id])
    @place.name = params[:name]
    @place.address = params[:address]
    if @place.save
      render "show.json.jb"
    else
      render json: { errors: @place.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    render json: {message: "Post successfully destroyed!"}
  end

  def show
    @place = Place.find(params[:id])
    render "show.json.jb"
  end

end
