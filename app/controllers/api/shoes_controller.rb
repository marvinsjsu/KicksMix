class ShoesController < ApplicationController

  def index
    @shoes = Shoe.all
    render json: @shoes
  end

  def show
    @shoe = Shoe.find(params[:id])
    render json: @shoe
  end

  def new
    @shoe = Shoe.new()
    render json: @shoe
  end

  def create
    @shoe = Shoe.new(shoe_params)

    if @shoe.save
      render json: @shoe
    else
      render json: @shoe.errors, status: :unprocessable_entity
    end
  end

  def update
    @shoe = Shoe.find(params[:id])

    if @shoe.update_attributes(shoe_params)
      render json: @shoe
    else
      render json: @shoe.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @shoe = Shoe.find(params[:id])
    @shoe.destroy!
    render json: @shoe
  end

  private

  def shoe_params
    params.require(:shoe).permit(:name, :category, :description, :photo, :brand)
  end
end