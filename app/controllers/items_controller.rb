class ItemsController < ApplicationController
  
  before_action :find_list
  before_action :get_item, only: [:show, :edit, :update]
  
  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = @list.items.new
  end

  def create
    @item = @list.items.new(item_params)

    if @item.save
      redirect_to list_item_path(@list.id, @item.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to list_item_path(@list.id, @item.id)
    else
      render :edit
    end
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to item_path
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :completed)
    end

    def find_list
      @list = List.find(params[:list_id])
    end

    def get_item
      @item = @list.items.find(params[:id])
    end

end
