class ReviewsController < ApplicationController
  before_action :current_user_must_be_review_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_review_user
    review = Review.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == review.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Review.ransack(params[:q])
    @reviews = @q.result(:distinct => true).includes(:item, :user).page(params[:page]).per(10)

    render("review_templates/index.html.erb")
  end

  def show
    @review = Review.find(params.fetch("id_to_display"))

    render("review_templates/show.html.erb")
  end

  def new_form
    @review = Review.new

    render("review_templates/new_form.html.erb")
  end

  def create_row
    @review = Review.new

    @review.item_id = params.fetch("item_id")
    @review.user_id = params.fetch("user_id")
    @review.picture = params.fetch("picture") if params.key?("picture")
    @review.review = params.fetch("review")
    @review.rating = params.fetch("rating")
    @review.orderagain = params.fetch("orderagain")
    @review.name = params.fetch("name")

    if @review.valid?
      @review.save

      redirect_back(:fallback_location => "/reviews", :notice => "Review created successfully.")
    else
      render("review_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_item
    @review = Review.new

    @review.item_id = params.fetch("item_id")
    @review.user_id = params.fetch("user_id")
    @review.picture = params.fetch("picture") if params.key?("picture")
    @review.review = params.fetch("review")
    @review.rating = params.fetch("rating")
    @review.orderagain = params.fetch("orderagain")
    @review.name = params.fetch("name")

    if @review.valid?
      @review.save

      redirect_to("/items/#{@review.item_id}", notice: "Review created successfully.")
    else
      render("review_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @review = Review.find(params.fetch("prefill_with_id"))

    render("review_templates/edit_form.html.erb")
  end

  def update_row
    @review = Review.find(params.fetch("id_to_modify"))

    @review.item_id = params.fetch("item_id")
    
    @review.picture = params.fetch("picture") if params.key?("picture")
    @review.review = params.fetch("review")
    @review.rating = params.fetch("rating")
    @review.orderagain = params.fetch("orderagain")
    @review.name = params.fetch("name")

    if @review.valid?
      @review.save

      redirect_to("/reviews/#{@review.id}", :notice => "Review updated successfully.")
    else
      render("review_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_item
    @review = Review.find(params.fetch("id_to_remove"))

    @review.destroy

    redirect_to("/items/#{@review.item_id}", notice: "Review deleted successfully.")
  end

  def destroy_row_from_user
    @review = Review.find(params.fetch("id_to_remove"))

    @review.destroy

    redirect_to("/users/#{@review.user_id}", notice: "Review deleted successfully.")
  end

  def destroy_row
    @review = Review.find(params.fetch("id_to_remove"))

    @review.destroy

    redirect_to("/reviews", :notice => "Review deleted successfully.")
  end
end
