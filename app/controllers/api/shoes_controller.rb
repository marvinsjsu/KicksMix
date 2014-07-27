class Api::ShoesController < ApplicationController

  def index
    @shoes = Shoe.all
    #render :json => @shoes
  end

  def show
    @shoe = Shoe.find(params[:id])
  end

  def new
    @shoe = Shoe.new()
    render json: @shoe
  end

  def create
    @shoe = Shoe.new(shoe_params)
    @shoe.author_id = get_current_user.id

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
    params.require(:shoe).permit(:name, :category, :price, :brand, :review, :shoe_photo, :shoe_photo_file_name, :shoe_photo_content_type, :shoe_photo_file_size, :shoe_photo_updated_at)
  end
end