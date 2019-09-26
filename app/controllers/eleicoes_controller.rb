class EleicoesController < SistemaController
  before_action :set_eleicao, only: [:edit, :update, :destroy, :show]
    
  # GET /fornecedores
  # GET /fornecedores.json
  def index
    @eleicoes = Eleicao.all
  end
  
  def show
  end
  
  # GET /fornecedores/new
  def new
    @eleicao = Eleicao.new
    authorize @eleicao
  end
  
  # GET /fornecedores/1/edit
  def edit
    authorize @eleicao
  end
  
  # POST /fornecedores
  # POST /fornecedores.json
  def create
    @eleicao = Eleicao.new(eleicao_params)
    
    if @eleicao.save
      redirect_to eleicoes_path, notice: "A Eleicao (#{@eleicao.descricao}) foi cadastrada com sucesso!"
    else
      render :new
    end
  end
  
  # PATCH/PUT /fornecedores/1
  # PATCH/PUT /fornecedores/1.json
  def update
    if @eleicao.update(eleicao_params)
      redirect_to eleicoes_path, notice: "A Eleicao (#{@eleicao.descricao}) foi atualizada com sucesso!"
    else
      render :edit
    end
  end
  
  # DELETE /fornecedores/1
  # DELETE /fornecedores/1.json
  def destroy
    authorize @eleicao
    eleicao_descricao = @eleicao.descricao
    
    if @eleicao.destroy
      redirect_to eleicoes_path, notice: "A Eleicao (#{eleicao_descricao}) foi excluída com sucesso!"
    else
      render :index
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eleicao
      @eleicao = Eleicao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eleicao_params
      params.require(:eleicao).permit(:descricao, :numerournas, :numeroeleitores, :numerocandidatos, :total_votos, :tempo_apuracao, :inicio_apuracao, :final_apuracao, :status)
    end
end