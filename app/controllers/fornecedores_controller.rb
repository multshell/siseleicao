class FornecedoresController < SistemaController
  before_action :set_fornecedor, only: [:edit, :update, :destroy]

  # GET /fornecedores
  # GET /fornecedores.json
  def index
    @fornecedores = Fornecedor.all
  end

  # GET /fornecedores/new
  def new
    @fornecedor = Fornecedor.new
    authorize @fornecedor
  end

  # GET /fornecedores/1/edit
  def edit
    authorize @fornecedor
  end

  # POST /fornecedores
  # POST /fornecedores.json
  def create
    @fornecedor = Fornecedor.new(fornecedor_params)
    
    if @fornecedor.save
      redirect_to fornecedores_path, notice: "O Fornecedor (#{@fornecedor.nome}) foi cadastrado com sucesso!"
    else
      render :new
    end
  end

  # PATCH/PUT /fornecedores/1
  # PATCH/PUT /fornecedores/1.json
  def update
    if @fornecedor.update(fornecedor_params)
      redirect_to fornecedores_path, notice: "O Fornecedor (#{@fornecedor.nome}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  # DELETE /fornecedores/1
  # DELETE /fornecedores/1.json
  def destroy
    authorize @fornecedor
    fornecedor_nome = @fornecedor.nome
    
    if @fornecedor.destroy
      redirect_to fornecedores_path, notice: "O Fornecedor (#{fornecedor_nome}) foi excluído com sucesso!"
    else
      render :index
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fornecedor
      @fornecedor = Fornecedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fornecedor_params
      params.require(:fornecedor).permit(:nome, :contato, :telefone, :email)
    end
end
