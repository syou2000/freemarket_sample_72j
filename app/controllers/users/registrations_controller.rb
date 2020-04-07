# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def index
  end

  def new
    super
    @user = User.new
    @user.build_profile
    # @profile = @user.build_profile
  end

  def create
    super
    User.create(user_params)
    after_sign_up_path_for(resource)
    # @user = User.new(user_params)
    # if @user.save
    # else
    #   render :new
    # end
  end

  def authentication
    @user = User.find_by(email: params[:email])
    @user.update(user_params)
    after_sign_up_path_for2
  end


  def complete
  end


  private
  def user_params
    params.permit(:email, :password, :first_name, :last_name, :first_name_kana, :phone_number, :last_name_kana, :year, :month, :day, profile_attributes: [:nickname])
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
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
    "/users/#{@user.id}/authentication"
  end

  def after_sign_up_path_for2(resource)
    super(resource)
    users_complete_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
