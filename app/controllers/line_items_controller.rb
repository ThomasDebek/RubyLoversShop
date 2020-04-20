class LineItemsController < ApplicationController

  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  def index
    @line_items = LineItem.all
  end

  def show
  end

  def new
    @line_item = LineItem.new
  end

  def edit
  end

  def create
    product = Product.all.find(params[:product_id])
    #@line_item = @cart.line_items.build(product: product)
    @line_item = @cart.add_product(product)
    current_item = @line_item.quantity
    if current_item  > 5
      flash[:notice] = 'Your basket may only have five products '
      redirect_to root_path
      #redirect_to @line_item.cart, notice: 'Line item was successfully created.'
    else
      @line_item.save
      redirect_to root_path
    end
  end

  def update
    if @line_item.update(line_item_params)
      redirect_to @line_item, notice: 'Line item was successfully updated.'
    else
      render :edit
    end
  end

  #def destroy
  #  @line_item.destroy
  #  #redirect_to line_items_url, notice: 'Line item was successfully destroyed.'
  #  redirect_to root_path , notice: 'Product was successfully destroyed.'
  #end

  def destroy
    @cart = @line_item.cart
    if @line_item.quantity > 1
      @line_item.quantity-=1
      @line_item.save
    else
      @line_item.destroy
    end
     redirect_to root_path
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    #params.require(:line_item).permit(:product_id, :cart_id)
    params.require(:line_item).permit(:product_id)
  end

end
