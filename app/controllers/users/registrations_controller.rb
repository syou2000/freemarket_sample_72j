# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      # flash.now[:alert] = @user.errors.full_messages
      flash.now[:alert] = "入力に誤りがあります"
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @address = @user.build_address
    render :new_address
  end

  def new_address
  end

  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new(address_params)
    unless @address.valid?
      # flash.now[:alert] = @address.errors.full_messages
      flash.now[:alert] = "入力に誤りがあります"
      render :new_address and return
    end
    @user.build_address(@address.attributes)
    @user.save
    sign_in(:user, @user)
  end

  def address
  end

  def complete
  end

  protected
  # private
  
  # def user_params
  #   params.permit(:email, :password, :first_name, :last_name, :first_name_kana, :last_name_kana, :year, :month, :day, profile_attributes: [:nickname])
  # end
  
  def address_params
    params.require(:address).permit(:last_name, :first_name, :last_name_hurigana, :first_name_hurigana, :zip_code, :city, :building, :prefecture, :house_number, :phone_number)

  end
  
  # POST /resource/registrations

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

  protected



  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    # devise_parameter_sanitizer.permit(:sign_up, keys: [profile_attributes: [:nickname]])
  end

  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
    user_authentication_path(@user.id)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
