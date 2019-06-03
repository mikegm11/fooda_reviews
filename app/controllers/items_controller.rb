class ItemsController < ApplicationController
  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(:distinct => true).includes(:restaurant, :reviews, :favorites).page(params[:page]).per(10)

    render("item_templates/index.html.erb")
  end

  def show
    @favorite = Favorite.new
    @review = Review.new
    @item = Item.find(params.fetch("id_to_display"))

    render("item_templates/show.html.erb")
  end

  def new_form
    @item = Item.new

    render("item_templates/new_form.html.erb")
  end

  def create_row
    @item = Item.new

    @item.restaurant_id = params.fetch("restaurant_id")
    @item.name = params.fetch("name")
    @item.vegetarian = params.fetch("vegetarian")
    @item.vegan = params.fetch("vegan")
    @item.description = params.fetch("description")

    if @item.valid?
      @item.save

      redirect_back(:fallback_location => "/items", :notice => "Item created successfully.")
    else
      render("item_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_restaurant
    @item = Item.new

    @item.restaurant_id = params.fetch("restaurant_id")
    @item.name = params.fetch("name")
    @item.vegetarian = params.fetch("vegetarian")
    @item.vegan = params.fetch("vegan")
    @item.description = params.fetch("description")

    if @item.valid?
      @item.save

      redirect_to("/restaurants/#{@item.restaurant_id}", notice: "Item created successfully.")
    else
      render("item_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @item = Item.find(params.fetch("prefill_with_id"))

    render("item_templates/edit_form.html.erb")
  end

  def update_row
    @item = Item.find(params.fetch("id_to_modify"))

    @item.restaurant_id = params.fetch("restaurant_id")
    @item.name = params.fetch("name")
    @item.vegetarian = params.fetch("vegetarian")
    @item.vegan = params.fetch("vegan")
    @item.description = params.fetch("description")

    if @item.valid?
      @item.save

      redirect_to("/items/#{@item.id}", :notice => "Item updated successfully.")
    else
      render("item_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_restaurant
    @item = Item.find(params.fetch("id_to_remove"))

    @item.destroy

    redirect_to("/restaurants/#{@item.restaurant_id}", notice: "Item deleted successfully.")
  end

  def destroy_row
    @item = Item.find(params.fetch("id_to_remove"))

    @item.destroy

    redirect_to("/items", :notice => "Item deleted successfully.")
  end
end
