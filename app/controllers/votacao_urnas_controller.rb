class VotacaoUrnasController < ApplicationController
  before_action :set_urna, only: [:edit, :update, :destroy, :show]
  before_action :set_options_for_select, only: [:new, :edit, :create, :update, :destroy]
    
  # GET /fornecedores
  # GET /fornecedores.json
  def index
    @urnas = Urna.all
  end
  
  def show
    @votacoes = Votacao.joins(:urna, :candidato).where('urna_id = ?', @urna.id).order("votos desc")
    @apurados = @votacoes.size
    @votosapurados = @votacoes.sum(:votos)
    @faltosos = @urna.eleitores - @votosapurados
    @votosbrancos = @votacoes.where(candidatos: { numero: '98'}).sum(:votos)
    @votosnulos = @votacoes.where(candidatos: { numero: '99'}).sum(:votos)
    @nominais = @votosapurados - @votosbrancos - @votosnulos
    #@votacoesfinalizadas = Votacao.joins(:urna, :candidato).where(urnas: { finalizada: true })
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
      params.require(:urna).permit(:escola, :numero, :localidade, :total_votacao, :eleicao_id)
    end
end
