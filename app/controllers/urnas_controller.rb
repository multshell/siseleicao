class UrnasController < SistemaController
  before_action :set_urna, only: [:edit, :update, :destroy, :show, :finaliza]
  before_action :set_options_for_select, only: [:new, :edit, :create, :update, :destroy]
    
  # GET /fornecedores
  # GET /fornecedores.json
  def index
    @urnas = Urna.all
  end
  
  def show
  end
  
  # GET /fornecedores/new
  def new
    @urna = Urna.new
    authorize @urna
  end
  
  # GET /fornecedores/1/edit
  def edit
    authorize @urna
  end
  
  # POST /fornecedores
  # POST /fornecedores.json
  def create
    @urna = Urna.new(urna_params)
    
    if @urna.save
      redirect_to urnas_path, notice: "A Urna (#{@urna.id} - #{@urna.escola}) foi cadastrada com sucesso!"
    else
      render :new
    end
  end
  
  # PATCH/PUT /fornecedores/1
  # PATCH/PUT /fornecedores/1.json
  def update
    if @urna.update(urna_params)
      redirect_to urnas_path, notice: "A Urna (#{@urna.id} - #{@urna.escola}) foi atualizada com sucesso!"
    else
      render :edit
    end
  end
  
  def finaliza
    
    @urna = Urna.find(@urna.id)
    @urna.finalizada = true
    
    if @urna.save
      redirect_to apuracao_urna_path(@urna), notice: "A apuração da urna (#{@urna.id} - #{@urna.escola}) foi finalizada com sucesso!"
    else
      render apuracao_urna_path(@urna)
    end
  end
  
  # DELETE /fornecedores/1
  # DELETE /fornecedores/1.json
  def destroy
    authorize @urna
    urna_id = @urna.id
    urna_escola = @urna.escola
    
    if @urna.destroy
      redirect_to urnas_path, notice: "A Urna (#{urna_id} - #{urna_escola}) foi excluída com sucesso!"
    else
      render :index
    end
  end
  
  private
  
    def set_options_for_select
      @eleicao_options_for_select = Eleicao.all
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_urna
      @urna = Urna.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def urna_params
      params.require(:urna).permit(:escola, :numero, :localidade, :total_votacao, :eleicao_id, :finalizada, :secoes, :eleitores)
    end
end