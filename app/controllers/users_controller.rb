class UsersController < Devise::RegistrationsController

  def index
    @users = User.all
  end

  def show
  end

  def update
    super
  end
end

private 

def user_params
  params.require(:user).permit(:avatar, :email)
end