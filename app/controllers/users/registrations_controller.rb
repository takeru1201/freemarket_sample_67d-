# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def index
  end
  
  def new
    @user = User.new
    # @address = Address.new
    @user.addresses.build
  end

  def create
    @user = User.new(user_params)
    # @address = Address.new(address_params)
    # binding.pry
    @user.save
    # @address.save
    redirect_to root_path
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, address_attributes:[user_id:current_user.id, :postal_code, :prefecture, :municipality, :house_number])
  end

  # def address_params
  #   params.require(:user).permit(:address_attributes)
  # end

end

  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
