class OrdersController < ApplicationController
  load_and_authorize_resource
  before_action :load_items, only: [:new, :edit, :show]

  def index
    @orders = @orders.paginate(page: params[:page], per_page: PER_PAGE_LIMIT)
    respond_to do |format|
      format.html
    end
  end

  # GET /orders/new
  def new
    respond_to do |format|
      format.html
    end
  end

  # GET /orders/1/edit
  def edit
    respond_to do |format|
      format.html
    end
  end

  # GET /orders/1
  def show
    respond_to do |format|
      format.html
    end
  end

  # PATCH /orders/1
  def update
    respond_to do |format|
      if @order.update_attributes(order_params)
        format.html { redirect_to @order, notice: "Order was successfully updated" }
      else
        flash[:error] = @order.errors.full_messages
        load_items
        format.html { render :edit }
      end
    end
  end

  # POST /orders
  def create
    @order.user_id = current_user.id
    respond_to do |format|
      if @order.save
        @order.send_email_for_order_creation
        format.html { redirect_to @order, notice: "Order was successfully created" }
      else
        flash.now[:error] = @order.errors.full_messages
        load_items
        format.html { render :new }
      end
    end
  end

  # DELETE /orders/1
  def destroy
   respond_to do |format|
      if @order.destroy
        format.html { redirect_to orders_path, notice: 'Order was successfully deleted.' }
        format.js
      else
        flash[:error] = @order.errors.full_messages
        format.js
      end
    end
  end

  private

  def order_params
    if params[:action] == "create"
      params.require(:order).permit(:description, line_items_attributes: [:item_id, :quantity, :_destroy])
    else
      params.require(:order).permit(:description, line_items_attributes: [:id, :item_id, :quantity, :_destroy])
    end
  end

  def load_items
    @items = Item.all
  end
end