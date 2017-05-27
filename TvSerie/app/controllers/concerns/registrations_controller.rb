class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication, only: [:new,:create, :cancel]
  #def create
    #super
    #@user.parent_id = params[:parent_id]
    #@user.save
  #end

  private
  def sign_up_params
    params.require(:user).permit(:admin, :email, :password, :password_confirmation, :parent_id)
  end

  def account_update_params
    params.require(:user).permit(:admin, :email, :password, :password_confirmation, :current_password)
  end
end