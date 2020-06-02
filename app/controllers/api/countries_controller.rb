class Api::CountriesController < ApplicationController
  before_action :set_country, only: [:show, :update, :destroy]

  # GET /api/countries
  def index
    @countries = Country.all

    render json: @countries
  end

  # GET /api/countries/1
  def show
    render json: @country
  end

  # POST /api/countries
  def create
    @country = Country.new(country_params)

    if @country.save
      render json: @country, status: :created, location: api_country_url(@country)
    else
      render json: @country.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/countries/1
  def update
    if @country.update(country_params)
      render json: @country
    else
      render json: @country.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/countries/1
  def destroy
    @country.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def country_params
      params.require(:country).permit(:name)
    end
end
