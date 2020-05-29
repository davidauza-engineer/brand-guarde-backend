class Api::ChainsController < ApplicationController
  before_action :set_chain, only: [:show, :update, :destroy]

  # GET /api/chains
  def index
    @chains = Chain.all

    render json: @chains
  end

  # GET /api/chains/1
  def show
    render json: @chain
  end

  # POST /api/chains
  def create
    @chain = Chain.new(chain_params)

    if @chain.save
      render json: @chain, status: :created, location: api_chain_url(@chain)
    else
      render json: @chain.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/chains/1
  def update
    if @chain.update(chain_params)
      render json: @chain
    else
      render json: @chain.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/chains/1
  def destroy
    @chain.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chain
      @chain = Chain.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def chain_params
      params.require(:chain).permit(:name)
    end
end
