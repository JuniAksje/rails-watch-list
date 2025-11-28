class ReviewsController < ApplicationController
  before_action :set_list, only: [:create]

  def create
    @review = Review.new(review_params)
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      # precisa recarregar coisas que a show usa
      @bookmarks = @list.bookmarks
      @reviews   = @list.reviews
      render "lists/show", status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    list = @review.list
    @review.destroy
    redirect_to list_path(list), status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
