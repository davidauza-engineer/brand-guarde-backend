class Api::ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :destroy]

  # GET /api/reviews
  def index
    @reviews = Review.all

    render json: @reviews
  end

  # GET /api/reviews/1
  def show
    render json: @review
  end

  # POST /api/reviews
  def create
    @review = Review.new(review_params)

    if @review.save
      render json: @review, status: :created, location: api_review_url(@review)
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/reviews/1
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/reviews/1
  def destroy
    @review.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def review_params
      params.require(:review).permit(:user_id, :restaurant_id, :body)
    end
end
