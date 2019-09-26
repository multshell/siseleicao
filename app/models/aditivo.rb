class Aditivo < ActiveRecord::Base
  belongs_to :contrato
  belongs_to :tipo_aditivo
  
  validates :numero, presence: true, length: {maximum:50}
  validates :contrato, presence: true
  validates :tipo_aditivo, presence: true
  validates :data_ass, presence: true
  validates :data_venc, presence: true
  
  # gem money-rails
  monetize :valor_cents
  
end
