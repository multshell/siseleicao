class ModalidadesController < SistemaController
  before_action :set_modalidade, only: [:edit, :update, :destroy]

  # GET /modalidades
  # GET /modalidades.json
  def index
    @modalidades = Modalidade.all
  end

  # GET /modalidades/new
  def new
    @modalidade = Modalidade.new
    authorize @modalidade
  end

  # GET /modalidades/1/edit
  def edit
    authorize @modalidade
  end

  # POST /modalidades
  # POST /modalidades.json
  def create
    @modalidade = Modalidade.new(modalidade_params)

    if @modalidade.save
      redirect_to modalidades_path, notice: "A Modalidade (#{@modalidade.descricao}) foi cadastrada com sucesso!"
    else
      render :new
    end
  end

  # PATCH/PUT /modalidades/1
  # PATCH/PUT /modalidades/1.json
  def update
    if @modalidade.update(modalidade_params)
      redirect_to modalidades_path, notice: "A Modalidade (#{@modalidade.descricao}) foi atualizada com sucesso!"
    else
      render :edit
    end
  end

  # DELETE /modalidades/1
  # DELETE /modalidades/1.json
  def destroy
    authorize @modalidade
    modalidade_descricao = @modalidade.descricao
    
    if @modalidade.destroy
      redirect_to modalidades_path, notice: "A Modalidade (#{@modalidade.descricao}) foi exluída com sucesso!"
    else
      render :index
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modalidade
      @modalidade = Modalidade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def modalidade_params
      params.require(:modalidade).permit(:descricao)
    end
end
