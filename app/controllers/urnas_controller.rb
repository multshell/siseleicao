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
      descricao_log = current_user.name + " incluiu a Urna " + @urna.inspect
      Log.create!(data_hora: Time.current, descricao: descricao_log)
      redirect_to urnas_path, notice: "A Urna (#{@urna.id} - #{@urna.escola}) foi cadastrada com sucesso!"
    else
      render :new
    end
  end
  
  # PATCH/PUT /fornecedores/1
  # PATCH/PUT /fornecedores/1.json
  def update
    
    @teste = Urna.find(@urna.id)
    alterados_log = ""
    
    if @urna.update(urna_params)
      
      n1 = false
      n2 = false
      n3 = false
      n4 = false
      n5 = false
      n6 = false
      n7 = false
      n8 = false
      
      if @teste.escola != @urna.escola
        n1 = true
        alterados_log = alterados_log + " escola: " + @urna.escola
      end
      if @teste.localidade != @urna.localidade
        n2 = true
        alterados_log = alterados_log + " localidade: " + @urna.localidade
      end
      if @teste.eleicao_id != @urna.eleicao_id
        n3 = true
        alterados_log = alterados_log + " eleicao_id: " + @urna.eleicao_id.to_s
      end
      if @teste.numero != @urna.numero
        n4 = true
        alterados_log = alterados_log + " numero: " + @urna.numero
      end
      if @teste.total_votacao != @urna.total_votacao
        n5 = true
        alterados_log = alterados_log + " total_votacao: " + @urna.total_votacao.to_s
      end
      if @teste.finalizada != @urna.finalizada
        n6 = true
        alterados_log = alterados_log + " finalizada: " + @urna.finalizada.to_s
      end
      if @teste.secoes != @urna.secoes
        n7 = true
        alterados_log = alterados_log + " secoes: " + @urna.secoes
      end
      if @teste.eleitores != @urna.eleitores
        n8 = true
        alterados_log = alterados_log + " eleitores: " + @urna.eleitores.to_s
      end
      descricao_log = current_user.name + " alterou a urna: " + @urna.id.to_s + ", para as seguintes informações: " + alterados_log
      
      if n1 or n2 or n3 or n4 or n5 or n6 or n7 or n8
        Log.create!(data_hora: Time.current, descricao: descricao_log)
      end
      
      redirect_to urnas_path, notice: "A Urna (#{@urna.id} - #{@urna.escola}) foi atualizada com sucesso!"
    else
      render :edit
    end
  end
  
  def finaliza
    
    @urna = Urna.find(@urna.id)
    @urna.finalizada = true
    descricao_log = current_user.name + " finalizou a apuração da urna: " + @urna.id.to_s
    if @urna.save
      Log.create!(data_hora: Time.current, descricao: descricao_log)
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
    descricao_log = current_user.name + " excluiu a Urna " + @urna.inspect
    
    if @urna.destroy
      Log.create!(data_hora: Time.current, descricao: descricao_log)
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