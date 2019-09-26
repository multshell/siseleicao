class EntidadesController < SistemaController
  before_action :set_entidade, only: [:edit, :update, :destroy]
  after_action :verify_authorized, only: [:new, :edit, :destroy]

  # GET /entidades
  # GET /entidades.json
  def index
    @entidades = Entidade.all
  end

  # GET /entidades/new
  def new
    @entidade = Entidade.new
    authorize @entidade
  end

  # GET /entidades/1/edit
  def edit
    authorize @entidade
  end

  # POST /entidades
  # POST /entidades.json
  def create
    @entidade = Entidade.new(entidade_params)
    
    if @entidade.save
      redirect_to entidades_path, notice: "A Entidade (#{@entidade.sigla}) foi cadastrada com sucesso!"
    else
      render :new
    end
  end

  # PATCH/PUT /entidades/1
  # PATCH/PUT /entidades/1.json
  def update
    if @entidade.update(entidade_params)
      redirect_to entidades_path, notice: "A Entidade (#{@entidade.sigla}) foi atualizada com sucesso!"
    else
      render :edit
    end
  end

  # DELETE /entidades/1
  # DELETE /entidades/1.json
  def destroy
    authorize @entidade
    entidade_sigla = @entidade.sigla
    
    if @entidade.destroy
      redirect_to entidades_path, notice: "A Entidade (#{entidade_sigla}) foi excluída com sucesso!"
    else
      render :index
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entidade
      @entidade = Entidade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entidade_params
      params.require(:entidade).permit(:sigla, :nome)
    end
end
