class AditivosController < SistemaController
  before_action :set_aditivo, only: [:edit, :update, :destroy]
  before_action :set_options_for_select, only: [:new, :edit, :create, :update, :destroy, :show]

  # GET /modalidades
  # GET /modalidades.json
  def index
    @aditivos = Aditivo.all
  end

  # GET /modalidades/new
  
  def show
    @contrato = Contrato.find(params[:id])
    @aditivo = Aditivo.new
    @aditivo.contrato = @contrato
    authorize @aditivo
  end

  # GET /modalidades/1/edit
  def edit
    @contrato = Contrato.find(@aditivo.contrato_id)
    authorize @aditivo
  end

  # POST /modalidades
  # POST /modalidades.json
  def create
    @aditivo = Aditivo.new(aditivo_params)

    if @aditivo.save
      redirect_to contrato_path(@aditivo.contrato_id), notice: "O Aditivo (#{@aditivo.numero}) foi cadastrado com sucesso!"
    else
      render :show
    end
  end

  # PATCH/PUT /modalidades/1
  # PATCH/PUT /modalidades/1.json
  def update
    if @aditivo.update(aditivo_params)
      redirect_to contrato_path(@aditivo.contrato_id), notice: "O Aditivo (#{@aditivo.numero}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  # DELETE /modalidades/1
  # DELETE /modalidades/1.json
  def destroy
    authorize @aditivo
    aditivo_numero = @aditivo.numero
    contrato_id = @aditivo.contrato_id
    
    if @aditivo.destroy
      redirect_to contrato_path(contrato_id), notice: "O Aditivo (#{aditivo_numero}) foi exluído com sucesso!"
    else
      render :index
    end
  end

  private
  
    def set_options_for_select
      @tipo_aditivo_options_for_select = TipoAditivo.all
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_aditivo
      @aditivo = Aditivo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aditivo_params
      params.require(:aditivo).permit(:numero, :contrato_id, :tipo_aditivo_id, :valor, :data_ass, :data_venc)
    end
end
