class ShopersController < ApplicationController
  before_action :set_shoper, only: [:show, :edit, :update, :destroy]

  # GET /shopers
  def index
    @shopers = Shoper.all
  end

  # GET /shopers/1
  def show
  end

  # GET /shopers/new
  def new
    @shoper = Shoper.new
  end

  # GET /shopers/1/edit
  def edit
  end

  # POST /shopers
  def create
    @shoper = Shoper.new(shoper_params)

    if @shoper.save
      redirect_to @shoper, notice: 'Shoper was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /shopers/1
  def update
    if @shoper.update(shoper_params)
      redirect_to @shoper, notice: 'Shoper was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /shopers/1
  def destroy
    @shoper.destroy
    redirect_to shopers_url, notice: 'Shoper was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shoper
      @shoper = Shoper.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shoper_params
      params.require(:shoper).permit(:name)
    end
end
