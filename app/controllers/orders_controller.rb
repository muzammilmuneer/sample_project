class OrdersController < ApplicationController
  load_and_authorize_resource

  def index
    @orders = Order.paginate(:page => params[:page], :per_page => PER_PAGE_LIMIT)
  end

  def new
    @items = Item.all
  end

  def edit
    @items = Item.all
  end

  def show
    @items = Item.all
  end


  def update
    if @order.update_attributes(order_params)
      redirect_to order_path
    else
      @items = Item.all
      render :edit
    end
  end

  def create
    @order.user_id = current_user.id
    if @order.save
      redirect_to order_path
    else
      @items = Item.all
      render :new
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.js
    end
  end

  private

  def order_params
    params.require(:order).permit(:description, line_items_attributes: [:id,:item_id, :quantity, :_destroy, :_edit])
  end

end