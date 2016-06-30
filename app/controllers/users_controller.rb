class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_filter :verify_authenticity_token

  #user registrieren
  def create
    @user = User.create(login: params[:login], salt_masterkey: params[:salt_masterkey], pubkey_user: params[:pubkey_user], privkey_user_enc: params[:privkey_user_enc])
    render plain: "Test"
  end

  #user löschen
  def delete
    @user = User.find_by(login: params[:login])
    if @user.nil?
      head 400
    else
      @user.destroy #löscht den User Return Code 200 "OK"
      head 200
    end
  end

  #pubkey anfordern
  def pubkey
    @user = User.find_by(login: params[:login])
    if @user.nil?
      #Return status 400
      head 400
    else
      #gibt den pubkey_user als JSON Format zurück
      render json: @user.to_json(only: %w(pubkey_user))
    end
  end

  #login
  def anmelden
    @user = User.find_by(login: params[:login])

    if @user.nil?
      #Return status 400
      head 400
    else
      render json: @user.to_json(only: %w(salt_masterkey privkey_user_enc pubkey_user))
      #gibt den salt_masterkey, privkey_user_enc, pubkey_user als JSON Format zurück
    end
  end
end
