class VotacaoCandidatosController < ApplicationController
  before_action :set_candidato, only: [:edit, :update, :destroy, :show]
  before_action :set_options_for_select, only: [:new, :edit, :create, :update, :destroy]
    
  # GET /fornecedores
  # GET /fornecedores.json
  def index
    @candidatos = Candidato.where("eleicao_id = 1").order("numero asc")
  end
  
  def show
    @votacoes = Votacao.joins(:urna, :candidato).where(urnas: {finalizada: true}).order("votos desc")
    @votacoescandidato = @votacoes.where('candidato_id = ?', @candidato.id)
    @totalvotos = @votacoescandidato.sum(:votos)
    @eleicao = Eleicao.find(1)
    #@votosapurados = @votacoes.sum(:votos)
    #@faltosos = @urna.eleitores - @votosapurados
    #@votosbrancos = @votacoes.where(candidatos: { numero: '98'}).sum(:votos)
    #@votosnulos = @votacoes.where(candidatos: { numero: '99'}).sum(:votos)
    #@nominais = @votosapurados - @votosbrancos - @votosnulos
    #@votacoesfinalizadas = Votacao.joins(:urna, :candidato).where(urnas: { finalizada: true })
  end
  
  private
  
    def set_options_for_select
      @eleicao_options_for_select = Eleicao.all
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_candidato
      @candidato = Candidato.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def urna_params
      params.require(:candidato).permit(:numero, :nome_completo, :nome_campanha, :eleicao_id, :foto)
    end
end
