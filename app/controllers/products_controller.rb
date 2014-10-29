class ProductsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def index
    @productss = Products.all
  	@products = if params[:keywords]
                 Products.where('name ilike ?',"%#{params[:keywords]}%")
               else
                 []
               end
  end
  def show
  	@product = Products.find(params[:id])
  end
  def create
    @product = Products.new(params.require(:product).permit(:name,:instructions))
    @product.save
    render 'show', status: 201
  end

  def update
    product = Products.find(params[:id])
    product.update_attributes(params.require(:product).permit(:name,:instructions))
    head :no_content
  end

  def destroy
    product = Products.find(params[:id])
    product.destroy
    head :no_content
  end
end
