class UsersController < ApplicationController

  #user registrieren
  def create
    @user = User.new(params[:user])
    User.find_by(params[:login]) != nil #wenn es den Login schon gibt Return Code 400 "Bad Request"
    if @user.nil?
      head 400
    else
      @user.save #speicher den User Return Code 200 "OK"
      head 200
    end
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
      render json: @user.to_json(only: %w(pubkey_user)) #gibt den pubkey_user als JSON Format zurück
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
