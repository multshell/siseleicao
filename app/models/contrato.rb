class Contrato < ActiveRecord::Base
  belongs_to :entidade
  belongs_to :fornecedor
  belongs_to :modalidade
  has_many :aditivos , inverse_of: :contrato
  
  validates :numero, presence: true
  validates :ano, presence: true
  validates :entidade, presence: true
  validates :fornecedor, presence: true
  validates :valor, presence: true
  validates :objeto, presence: true
  validates :modalidade, presence: true
  validates :data_ass, presence: true
  validates :data_venc, presence: true
  
  validates :numero, uniqueness: { scope: :ano, message: "de contrato já existe" }
  
  # gem money-rails
  monetize :valor_cents
  
end
