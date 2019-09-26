class User < ActiveRecord::Base
  
  enum role: {:completo => 0, :restrito => 1}
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates_presence_of :name, message: 'não pode ser deixado em branco'
end
