class Urna < ActiveRecord::Base
    has_many :votacoes
    belongs_to :eleicao
    
    validates :numero, uniqueness: true
    validates_size_of :numero, maximum: 200
    validates_presence_of :secoes, message: "deve ser preenchido"
    validates_size_of :secoes, maximum: 300
    validates_presence_of :escola, message: "deve ser preenchido"
    validates_presence_of :localidade, message: "deve ser preenchido"
    validates_presence_of :eleicao_id
    validates_numericality_of :eleitores, greater_than: 0,
                                message: " - deve ser um número maior do que 0"
end
