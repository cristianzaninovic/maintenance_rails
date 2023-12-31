class MotorsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_motor, only: %i[ show edit update destroy ]

  # GET /motors or /motors.json
  def index
    if params[:search].present?
      @pagy, @motors = pagy(Motor.where("name LIKE ? OR description LIKE ?", "\%#{params[:search]}\%", "\%#{params[:search]}\%"), items: 10)
    else      
      @pagy, @motors = pagy((Motor.all.order(name: :desc)), items: 8)
    end    
    @motors = Motor.all
  end

  # GET /motors/1 or /motors/1.json
  def show
    random_number = rand(1..10)
    formatted_number = random_number < 10 ? "0#{random_number}" : random_number.to_s
    @random_motor_image = "motor#{formatted_number}"
  end

  # GET /motors/new
  def new
    @motor = Motor.new
  end

  # GET /motors/1/edit
  def edit
  end

  # POST /motors or /motors.json
  def create
    @motor = Motor.new(motor_params)

    respond_to do |format|
      if @motor.save
        format.html { redirect_to motor_url(@motor), notice: "Motor was successfully created." }
        format.json { render :show, status: :created, location: @motor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @motor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /motors/1 or /motors/1.json
  def update
    respond_to do |format|
      if @motor.update(motor_params)
        format.html { redirect_to motor_url(@motor), notice: "Motor was successfully updated." }
        format.json { render :show, status: :ok, location: @motor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @motor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motors/1 or /motors/1.json
  def destroy
    @motor.destroy

    respond_to do |format|
      format.html { redirect_to motors_url, notice: "Motor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motor
      @motor = Motor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def motor_params
      params.require(:motor).permit(:name, :motor_class, :description)
    end
end
