class TipoAditivosController < SistemaController
  before_action :set_tipo_aditivo, only: [:edit, :update, :destroy]

  # GET /modalidades
  # GET /modalidades.json
  def index
    @tipo_aditivos = TipoAditivo.all
  end

  # GET /modalidades/new
  def new
    @tipo_aditivo = TipoAditivo.new
    authorize @tipo_aditivo
  end

  # GET /modalidades/1/edit
  def edit
    authorize @tipo_aditivo
  end

  # POST /modalidades
  # POST /modalidades.json
  def create
    @tipo_aditivo = TipoAditivo.new(tipo_aditivo_params)

    if @tipo_aditivo.save
      redirect_to tipo_aditivos_path, notice: "O Tipo de Aditivo (#{@tipo_aditivo.descricao}) foi cadastrado com sucesso!"
    else
      render :new
    end
  end

  # PATCH/PUT /modalidades/1
  # PATCH/PUT /modalidades/1.json
  def update
    if @tipo_aditivo.update(tipo_aditivo_params)
      redirect_to tipo_aditivos_path, notice: "O Tipo de Aditivo (#{@tipo_aditivo.descricao}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  # DELETE /modalidades/1
  # DELETE /modalidades/1.json
  def destroy
    authorize @tipo_aditivo
    tipo_aditivo_descricao = @tipo_aditivo.descricao
    
    if @tipo_aditivo.destroy
      redirect_to tipo_aditivos_path, notice: "O Tipo de Aditivo (#{@tipo_aditivo.descricao}) foi exluído com sucesso!"
    else
      render :index
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_aditivo
      @tipo_aditivo = TipoAditivo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_aditivo_params
      params.require(:tipo_aditivo).permit(:descricao)
    end
end