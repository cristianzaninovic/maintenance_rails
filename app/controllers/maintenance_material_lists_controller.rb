class MaintenanceMaterialListsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_maintenance_material_list, only: %i[ show edit update destroy ]

  # GET /maintenance_material_lists or /maintenance_material_lists.json
  def index
    @maintenance_material_lists = MaintenanceMaterialList.all
  end

  # GET /maintenance_material_lists/1 or /maintenance_material_lists/1.json
  def show
  end

  # GET /maintenance_material_lists/new
  def new
    @maintenance_material_list = MaintenanceMaterialList.new
  end

  # GET /maintenance_material_lists/1/edit
  def edit
  end

  # POST /maintenance_material_lists or /maintenance_material_lists.json
  def create
    @maintenance_material_list = MaintenanceMaterialList.new(maintenance_material_list_params)

    respond_to do |format|
      if @maintenance_material_list.save
        format.html { redirect_to maintenance_material_list_url(@maintenance_material_list), notice: "Maintenance material list was successfully created." }
        format.json { render :show, status: :created, location: @maintenance_material_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @maintenance_material_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance_material_lists/1 or /maintenance_material_lists/1.json
  def update
    respond_to do |format|
      if @maintenance_material_list.update(maintenance_material_list_params)
        format.html { redirect_to maintenance_material_list_url(@maintenance_material_list), notice: "Maintenance material list was successfully updated." }
        format.json { render :show, status: :ok, location: @maintenance_material_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @maintenance_material_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance_material_lists/1 or /maintenance_material_lists/1.json
  def destroy
    @maintenance_material_list.destroy

    respond_to do |format|
      format.html { redirect_to maintenance_material_lists_url, notice: "Maintenance material list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_material_list
      @maintenance_material_list = MaintenanceMaterialList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def maintenance_material_list_params
      params.require(:maintenance_material_list).permit(:material_id, :maintenance_id)
    end
end
