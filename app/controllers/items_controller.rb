class ItemsController < ApplicationController
  load_and_authorize_resource


  # GET /items
  def index
    @items = @items.paginate(page: params[:page], per_page: PER_PAGE_LIMIT)
    respond_to do |format|
      format.html
    end
  end

  # GET /items/1
  def show
    respond_to do |format|
      format.html
    end
  end

  # GET /items/new
  def new
    respond_to do |format|
      format.html
    end
  end

  # GET /items/1/edit
  def edit
    respond_to do |format|
      format.html
    end
  end

  # POST /items
  def create
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
      else
        flash[:error] = @item.errors.full_messages
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /items/1
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
      else
        flash[:error] = @item.errors.full_messages
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /items/1
  def destroy
    if @item.destroy
      flash[:notice] = 'Item was successfully deleted.'
    else
      flash[:error] = @item.errors.full_messages
    end
    respond_to do |format|
      format.html { redirect_to items_path }
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price)
  end
end
