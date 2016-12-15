class AtmMachesController < ApplicationController
   before_action :set_atm_mach, only: [:show, :edit, :update, :destroy]
  skip_before_filter :authenticate_user!, only: [:index]
  # GET /atm_maches
  # GET /atm_maches.json
  def index
    if params[:search].present?
      @atm_machs = AtmMach.near(params[:search], 50, :order => :distance)
    else
    @atm_machs = AtmMach.all
    end
  end

  # GET /atm_maches/1
  # GET /atm_maches/1.json
  def show
     session[:atm_no] = @atm_mach.id

  end

  # GET /atm_maches/new
  def new
    @atm_mach = AtmMach.new
  end

  # GET /atm_maches/1/edit
  def edit
  end

  # POST /atm_maches
  # POST /atm_maches.json
  def create
    @atm_mach = AtmMach.new(atm_mach_params)

    respond_to do |format|
      if @atm_mach.save
        format.html { redirect_to @atm_mach, notice: ' successfully created.' }
        format.json { render :show, status: :created, location: @atm_mach }
      else
        format.html { render :new }
        format.json { render json: @atm_mach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atm_maches/1
  # PATCH/PUT /atm_maches/1.json
  def update
    respond_to do |format|
      if @atm_mach.update(atm_mach_params)
        format.html { redirect_to @atm_mach, notice: ' successfully updated.' }
        format.json { render :show, status: :ok, location: @atm_mach }
      else
        format.html { render :edit }
        format.json { render json: @atm_mach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atm_maches/1
  # DELETE /atm_maches/1.json
  def destroy
    @atm_mach.destroy
    respond_to do |format|
      format.html { redirect_to atm_maches_url, notice: 'successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_atm_mach
      @atm_mach = AtmMach.find(params[:id])
    end

  
    def atm_mach_params
      params.require(:atm_mach).permit( :address)
    end
end
