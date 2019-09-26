class UsersController < SistemaController
  before_action :set_user, only: [:edit, :update, :destroy]
  
  def index
    @users = User.where("id != '1'")
  end
  
  def new
    @user = User.new
    authorize @user
  end
  
  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to users_path, notice: "O Usuário (#{@user.email}) foi cadastrado com sucesso!"
    else
      render :new
    end
  end
  
  def edit
    authorize @user
  end

  def update
    passwd = params[:user][:password]
    passwd_confirmation = params[:user][:password_confirmation]
    
    if passwd.blank? && passwd_confirmation.blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    
    if @user.update(params_user)
      redirect_to users_path, notice: "O Usuário (#{@user.email}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end
  
  def destroy
    authorize @user
    user_email = @user.email
    
    if @user.destroy
      redirect_to users_path, notice: "O Usuário (#{user_email}) foi excluído com sucesso!"
    else
      render :index
    end
  end
  
  private
  
    def set_user
      @user = User.find(params[:id])
    end
    
    def params_user
      params.require(:user).permit(:name, :email, :role, :password, :password_confirmation)
    end
  
end
