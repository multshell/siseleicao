class Candidato < ActiveRecord::Base
    has_many :votacoes
    belongs_to :eleicao
    
    has_attached_file :foto, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :foto, :content_type => /\Aimage\/.*\Z/
    
    validates_size_of :numero, maximum: 2
    validates :numero, uniqueness: { scope: :eleicao_id, message: "de Candidato ja cadastrado" }
    validates_presence_of :numero
    validates_presence_of :nome_campanha, message: "deve ser preenchido"
end
