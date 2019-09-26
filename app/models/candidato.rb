class Candidato < ActiveRecord::Base
    has_many :votacoes
    belongs_to :eleicao
    
    validates_size_of :numero, maximum: 2
    validates :numero, uniqueness: { scope: :eleicao_id, message: "de Candidato ja cadastrado" }
    validates_presence_of :numero
    validates_presence_of :nome_campanha, message: "deve ser preenchido"
end
