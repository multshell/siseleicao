class SistemaController < ApplicationController
 before_action :authenticate_user!

 layout "sistema"
end