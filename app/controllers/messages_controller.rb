class MessagesController < ApplicationController
  require 'openssl'
  
  def create
    now = Time.now.to_i
    if now - params[:timestamp].to_i <= 300
      begin
        @user = User.find_by(login: params[:login])
        pubKey = OpenSSL::PKey::RSA.new @user.pubkey_user
        pubKey.public_decrypt(params[:digital_signature])
      rescue
        head 400
      end
      Message.new(sender: params[:login], content_enc: params[:content_enc], iv: params[:iv], key_recipient_enc: params[:key_recipient_enc], sig_service: params[:sig_service], sig_recipient: params[:sig_recipient], recipient: params[:recipient], cipher: params[:cipher])
    else
      head 400
    end
  end


  def message
    now = Time.now.to_i
    if now - params[:timestamp].to_i <= 300
      begin
        @user = User.find_by(login: params[:login])
        pubKey = OpenSSL::PKey::RSA.new @user.pubkey_user
        pubKey.public_decrypt(params[:sig_service])
      rescue
        head 400
      end
        message = Message.where(recipient: params[:login])
        render json: message.to_json(only: %w(sig_recipient key_recipient_enc cipher login iv))
    else
      head 400
    end
  end
end



